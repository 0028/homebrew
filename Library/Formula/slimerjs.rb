require 'formula'

class Slimerjs < Formula
  homepage 'http://www.slimerjs.org'
  url "http://download.slimerjs.org/v0.9/0.9.0/slimerjs-0.9.0.zip"
  sha1 "c78cf0961eba2421abfdf5c99d28f6fe8dba7cc8"

  head 'https://github.com/laurentj/slimerjs.git'

  bottle do
    cellar :any
    sha1 "1206b2c72bed49b5dfcf6f9f1e6ee4c83f138044" => :mavericks
    sha1 "6bacacc848c13f1a1ec400d98dfc192b1f2ac3dd" => :mountain_lion
    sha1 "5eef648559bf98c4b53468dcb86cb2cca9fbc6f2" => :lion
  end

  if MacOS.version > :snow_leopard
    option "without-xulrunner", "Build without xulrunner (requires a installed Firefox)"
    depends_on "xulrunner" => :recommended
  end

  def install
    unless build.stable?
      cd "src"
      system "zip", "-r", "omni.ja", "chrome/", "components/", "modules/",
                    "defaults/", "chrome.manifest", "-x@package_exclude.lst"
    end
    inreplace "application.ini" ,"MaxVersion=27.*", "MaxVersion=28.*" if build.stable? and build.with? "xulrunner"
    libexec.install ["application.ini", "omni.ja", "slimerjs", "slimerjs.py"]
    bin.install_symlink libexec/"slimerjs"
  end

  def caveats; <<-EOS.undent
    You can set the environment variable SLIMERJSLAUNCHER to a installation of
    Mozilla Firefox (or Mozilla XULRunner) to use this version with SlimerJS instead
    of the one installed by Homebrew (this is required if build without xulrunner).
    For a standard Mozilla Firefox installation this would be:

      export SLIMERJSLAUNCHER=/Applications/Firefox.app/Contents/MacOS/firefox

    Note: If you use SlimerJS with an unstable version of Mozilla Firefox/XULRunner
    (>27.*) you may have to change the [Gecko]MaxVersion in:
      #{libexec}/application.ini
    EOS
  end

  test do
    system "#{bin}/slimerjs", "-v"
    curl "-O", "https://raw.github.com/laurentj/slimerjs/ec1e53a/examples/phantomjs/loadspeed.js"
    system "#{bin}/slimerjs", "loadspeed.js", "www.google.com"
  end
end
