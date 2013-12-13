require 'formula'

class Slimerjs < Formula
  homepage 'http://www.slimerjs.org'
  url 'http://download.slimerjs.org/v0.9/0.9.0/slimerjs-0.9.0.zip'
  sha1 'c78cf0961eba2421abfdf5c99d28f6fe8dba7cc8'

  head 'https://github.com/laurentj/slimerjs.git'

  bottle do
    cellar :any
    sha1 'f8c86138c41dd950015bdb20b6981a8228d0c789' => :mavericks
    sha1 '0813996a0cb185b362818bedb8fdf8d0d8f64ba3' => :mountain_lion
    sha1 '2c0f9bcc449fd8f849d2e88639a8bcde490af373' => :lion
  end

  if MacOS.version > :snow_leopard
    option 'without-xulrunner', 'Build with xulrunner (requires a local Firefox installation, default on OS X 10.6 and below)'
    depends_on 'xulrunner' => :recommended
  end

  def install
    unless build.stable?
      cd 'src'
      system 'zip -r omni.ja chrome/ components/ modules/ defaults/ chrome.manifest -x@package_exclude.lst'
    end
    libexec.install %w[application.ini omni.ja slimerjs slimerjs.py]
    bin.install_symlink libexec/'slimerjs'
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
    system "#{bin}/slimerjs", '-v'
    curl '-O', 'https://raw.github.com/laurentj/slimerjs/ec1e53a/examples/phantomjs/loadspeed.js'
    system "#{bin}/slimerjs loadspeed.js www.google.com"
  end
end
