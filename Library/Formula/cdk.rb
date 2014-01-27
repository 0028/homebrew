require 'formula'

class Cdk < Formula
  homepage 'http://invisible-island.net/cdk/'
  url 'ftp://invisible-island.net/cdk/cdk-5.0-20140118.tgz'
  version '5.0.20140118'
  sha1 'd900e9e0d54a90701541d40ff7137507baf3b382'

  bottle do
    cellar :any
    sha1 "e85096a933c9674ceae6526f20a4e8da44d935b5" => :mavericks
    sha1 "f27ddb1b0300213f4127b2b944df0073f59133a2" => :mountain_lion
    sha1 "1a0a895db7c568857e0ff6001627d1c55f561352" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
