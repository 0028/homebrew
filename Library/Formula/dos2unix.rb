require 'formula'

class Dos2unix < Formula
  homepage 'http://waterlan.home.xs4all.nl/dos2unix.html'
  url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.4.tar.gz'
  sha1 '93d73148c09908a42dcbf5339312c9aa1f18ba7c'

  bottle do
    sha1 "7ce8c4c31c842caa2e7f576042aafa5518a1e9ff" => :mavericks
    sha1 "ddce204df82c4c00cd8d6e7044f39bc922b3153f" => :mountain_lion
    sha1 "3bc36d71a3e5b4843131c87893d69172e4814de3" => :lion
  end

  depends_on 'gettext'

  devel do
    url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.5-beta7.tar.gz'
    sha1 '0ccd9969ecefd8e578f023c00c7962e1ae1f6333'
  end

  def install
    gettext = Formula["gettext"]
    system "make", "prefix=#{prefix}",
                   "CC=#{ENV.cc}",
                   "CPP=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "CFLAGS_OS=-I#{gettext.include}",
                   "LDFLAGS_EXTRA=-L#{gettext.lib} -lintl",
                   "install"
  end

  test do
    (testpath/'dosfile.txt').write("File with CRLFs\r\nThey will be converted")
    system "#{bin}/dos2unix", 'dosfile.txt'
    open('dosfile.txt') do |f|
      converted = f.read(64)
      fail if converted.include?("\r")
    end
  end
end
