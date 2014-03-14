require 'formula'

class Libbson < Formula
  homepage 'https://github.com/mongodb/libbson'
  url 'https://github.com/mongodb/libbson/releases/download/0.6.4/libbson-0.6.4.tar.gz'
  sha1 '70fa36361fa43aad0a0d429e4b159b6de8dd464f'

  bottle do
    cellar :any
    sha1 "434ad5250b3312ca53de5d71abd6b5c8149197df" => :mavericks
    sha1 "c17c82025dbcd6bd1ced83fd3306a870292ce4c5" => :mountain_lion
    sha1 "708dc2db7dcfe7b1999a14823368bfaf2b777ffb" => :lion
  end

  depends_on :automake

  def install
    system "./configure", "--enable-silent-rules", "--prefix=#{prefix}"
    system "make", "install"
  end
end
