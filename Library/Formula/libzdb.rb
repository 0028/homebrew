require 'formula'

class Libzdb < Formula
  homepage 'http://tildeslash.com/libzdb/'
  url 'http://tildeslash.com/libzdb/dist/libzdb-3.0.tar.gz'
  sha1 'bcf14c11cfcd0c05ecc8740f43cd0d6170406dc1'

  bottle do
    cellar :any
    sha1 "7e879efb598770766efe724382e759611c967171" => :mavericks
    sha1 "e44d8e7773f63c71bb2897fb2dcf31f3c47d3368" => :mountain_lion
    sha1 "b7a1879d4a670a0201fcfcd70b80621d16afa036" => :lion
  end

  depends_on :postgresql => :recommended
  depends_on :mysql => :recommended
  depends_on 'sqlite' => :recommended

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--without-postgresql" if build.without? 'postgresql'
    args << "--without-mysql" if build.without? 'mysql'
    args << "--without-sqlite" if build.without? 'sqlite'

    system "./configure", *args
    system "make install"
  end
end
