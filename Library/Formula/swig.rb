require 'formula'

class Swig < Formula
  homepage 'http://www.swig.org/'
  url 'http://downloads.sourceforge.net/project/swig/swig/swig-2.0.12/swig-2.0.12.tar.gz'
  sha1 '4203c68f79012a2951f542018ff4358d838b5035'

  bottle do
    sha1 "5e429bc6228e8ec1f154ee5eb9497b54b8b765d5" => :mavericks
    sha1 "3450a517559bab7e73b581b568a925c98bd88788" => :mountain_lion
    sha1 "9ada5b6baa6bd47b0f6c35ff737d4ddce3eaffe3" => :lion
  end

  option :universal

  depends_on 'pcre'

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
