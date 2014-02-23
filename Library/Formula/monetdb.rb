require 'formula'

class Monetdb < Formula
  homepage 'http://www.monetdb.org/'
  url 'http://www.monetdb.org/downloads/sources/Jan2014/MonetDB-11.17.9.zip'
  sha1 '4669b54fa9a74bba068756ac3902fd8e362a151b'

  bottle do
    sha1 "6a68751845bcd0c7d58563ae634b6f21ceafc059" => :mavericks
    sha1 "ac865714ff7f34bd080c4425df923ef33ddac216" => :mountain_lion
    sha1 "58d480defe5ab75cba7a4f847ffa08bf442ae0e7" => :lion
  end

  head 'http://dev.monetdb.org/hg/MonetDB', :using => :hg

  depends_on 'pkg-config' => :build
  depends_on :ant
  depends_on 'pcre'
  depends_on 'readline' # Compilation fails with libedit.

  def install
    system "./bootstrap" if build.head?

    system "./configure", "--prefix=#{prefix}",
                          "--enable-debug=no",
                          "--enable-assert=no",
                          "--enable-optimize=yes",
                          "--enable-testing=no",
                          "--disable-jaql",
                          "--without-rubygem"
    system "make install"
  end
end
