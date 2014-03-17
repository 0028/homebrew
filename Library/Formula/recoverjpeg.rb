require 'formula'

class Recoverjpeg < Formula
  homepage 'http://www.rfc1149.net/devel/recoverjpeg.html'
  url 'http://www.rfc1149.net/download/recoverjpeg/recoverjpeg-2.3.tar.gz'
  sha1 'ed16b9852d85d7a07710d1ca41a03427642f3f38'

  bottle do
    cellar :any
    sha1 "400447d911b1dc743c4824ef7a1644634fd164f1" => :mavericks
    sha1 "a3e406823dca2001f5a47c2389b5bfc33a2bcd99" => :mountain_lion
    sha1 "01e1f45f64dd1442a08aee017a2147a4e1e15d3c" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
