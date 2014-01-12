require 'formula'

class Hydra < Formula
  homepage 'http://www.thc.org/thc-hydra/'
  url 'http://www.thc.org/releases/hydra-7.6.tar.gz'
  sha1 '7df230bb4f228a5cdc776ef1a215a1523b58f40b'

  bottle do
    sha1 '52d5004513bba562179264fa98052335fab0c27a' => :mavericks
    sha1 'e933c03b62c4075344fa5bd905a219103a676df9' => :mountain_lion
    sha1 'a222d5d6681868a905e1dbe63947685aa2c989bd' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    bin.mkpath
    system "make all install"
    share.install prefix/"man" # Put man pages in correct place
  end
end
