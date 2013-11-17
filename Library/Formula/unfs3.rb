require 'formula'

class Unfs3 < Formula
  homepage 'http://unfs3.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz'
  sha1 'a6c83e1210ce75836c672cd76e66577bfef7a17a'
  head 'https://svn.code.sf.net/p/unfs3/code/trunk/'

  bottle do
    cellar :any
    sha1 '32b8b6750bf8db25686e45d5aa6e5289584f5359' => :mavericks
    sha1 'de8175939db70a3ceb809ecdeb64db20c7e45a54' => :mountain_lion
    sha1 '458172f1aa59badfb80a772ea3247bcb944d0c28' => :lion
  end

  if build.head?
    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    ENV.j1 # Build is not parallel-safe
    system "./bootstrap" if build.head?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
