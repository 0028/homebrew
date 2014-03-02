require 'formula'

class Jq < Formula
  homepage 'http://stedolan.github.io/jq/'
  url 'http://stedolan.github.io/jq/download/source/jq-1.3.tar.gz'
  sha1 'ac1f19e5d9921683af25251e97c2c4bfee895ca2'

  bottle do
    cellar :any
    sha1 "c0d42b8b3e93fb8ad2c289488dd6f1ca71c3a957" => :mavericks
    sha1 "ddebced7fc28afdfc5c36f234dd1da3d9a5e3a72" => :mountain_lion
    sha1 "8c77890c2829d42a175d0bd2f5edc287e8f0ba28" => :lion
  end

  head do
    url 'https://github.com/stedolan/jq.git'

    depends_on 'autoconf' => :build
    depends_on 'automake' => :build
    depends_on 'libtool' => :build
    depends_on 'bison' => :build
  end

  def install
    system "autoreconf", "-iv" if build.head?
    system "./configure"
    system "make"
    bin.install 'jq'
    man1.install 'jq.1'
  end

  test do
    assert_equal "2\n", pipe("#{bin}/jq .bar", '{"foo":1, "bar":2}')
  end
end
