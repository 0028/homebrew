require 'formula'

class Monetdb < Formula
  homepage 'http://www.monetdb.org/'
  url 'http://dev.monetdb.org/downloads/sources/Jan2014-SP1/MonetDB-11.17.13.zip'
  sha1 '51f3fd5a61ffd2bcc85148a3f0bd953a6fc31553'

  bottle do
    sha1 "e26b8cccfcc8ab24ee6644ed37d872ed9e4446b6" => :mavericks
    sha1 "aa8d9d868c2930c32e7625e55dbe2e69a4d92611" => :mountain_lion
    sha1 "f1e05c68122b543a2b0b9c5c02f8aedd9e2da248" => :lion
  end

  head 'http://dev.monetdb.org/hg/MonetDB', :using => :hg

  option 'with-java'

  depends_on 'pkg-config' => :build
  depends_on :ant
  depends_on 'pcre'
  depends_on 'readline' # Compilation fails with libedit.

  def install
    system "./bootstrap" if build.head?

    args = ["--prefix=#{prefix}",
            "--enable-debug=no",
            "--enable-assert=no",
            "--enable-optimize=yes",
            "--enable-testing=no",
            "--disable-jaql",
            "--without-rubygem"]

    args << "--with-java=no" if build.without? 'java'

    system "./configure", *args
    system "make install"
  end
end
