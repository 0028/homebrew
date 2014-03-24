require 'formula'

class Appledoc < Formula
  homepage 'http://appledoc.gentlebytes.com/'
  url "https://github.com/tomaz/appledoc/archive/v2.2-963.tar.gz"
  sha1 '8491dc9ae8fa6bc69da9dcedca601529af3bf4e6'

  head 'https://github.com/tomaz/appledoc.git', :branch => 'master'

  bottle do
    sha1 "d75c85aec207abdd045b33da089cafc89d5676e5" => :mavericks
    sha1 "753284b30a42318dc3cf146862abe95e394f8595" => :mountain_lion
    sha1 "e27be43033f2a3bbda89aa754135226377d67110" => :lion
  end

  depends_on :xcode
  depends_on :macos => :lion

  def install
    xcodebuild "-project", "appledoc.xcodeproj",
               "-target", "appledoc",
               "-configuration", "Release",
               "clean", "install",
               "SYMROOT=build",
               "DSTROOT=build",
               "INSTALL_PATH=/bin",
               "GCC_ENABLE_OBJC_GC=unsupported",
               "OTHER_CFLAGS='-DCOMPILE_TIME_DEFAULT_TEMPLATE_PATH=@\"#{prefix}/Templates\"'"
    bin.install "build/bin/appledoc"
    prefix.install "Templates/"
  end

  test do
    system "#{bin}/appledoc", "--version"
  end
end
