require 'formula'

class Dos2unix < Formula
  homepage 'http://waterlan.home.xs4all.nl/dos2unix.html'
  url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.4.tar.gz'
  sha1 '93d73148c09908a42dcbf5339312c9aa1f18ba7c'

  bottle do
    sha1 "d2057fe51b8e72e1c353daa7560b754b715359f6" => :mavericks
    sha1 "84f76effeffb4be53b656423fe2a4074726189b1" => :mountain_lion
    sha1 "08614caaf127d2badf1e16523aae3fcb98bbde44" => :lion
  end

  depends_on 'gettext'

  devel do
    url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.5-beta11.tar.gz'
    sha1 'f7d17dc4dbf723c81d1459b9664fc8045a77541d'
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
