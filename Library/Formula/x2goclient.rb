require 'formula'

class X2goclient < Formula
  homepage 'http://www.x2go.org'
  url 'http://code.x2go.org/releases/source/x2goclient/x2goclient-4.0.1.3.tar.gz'
  sha1 '37b946b5b6d0a072a6d1fee98ae43bef929f2abd'
  head 'http://code.x2go.org/git/x2goclient.git'

  bottle do
    sha1 "874407ea3a0270d62fc2b817c1061441dd1103cb" => :mavericks
    sha1 "c21f3beb8af06b982fab0ca0c6d4de90b404512f" => :mountain_lion
    sha1 "7d9a400fa64a6c86cc53bb8e4b703e9149f8d853" => :lion
  end

  depends_on :x11
  depends_on :libpng
  depends_on 'jpeg'
  depends_on 'nxcomp'
  depends_on 'libssh'
  depends_on 'qt'

  def install
    # Configure
    system "lrelease", "#{name}.pro"
    system "qmake", "-config", "release"

    # Actual build
    system "make"

    # Bundle build
    system "macdeployqt", "#{name}.app"

    # Link nxproxy binary (this quirck avoids patching upstream)
    system "mkdir", "-p", "#{name}.app/Contents/exe"
    system "ln", "-s", "#{HOMEBREW_PREFIX}/bin/nxproxy", "#{name}.app/Contents/exe/"

    # Install app
    prefix.install "#{name}.app"

    # Symlink in the command-line version
    bin.install_symlink prefix/"#{name}.app/Contents/MacOS/#{name}"
  end

  def caveats; <<-EOS
    #{name}.app was installed in:
    #{prefix}
    To symlink into ~/Applications, you can do:
      brew linkapps
    or
      sudo ln -s #{prefix}/#{name}.app /Applications
    EOS
  end
end
