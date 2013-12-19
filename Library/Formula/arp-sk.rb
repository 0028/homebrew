require 'formula'

class ArpSk < Formula
  homepage 'http://sid.rstack.org/arp-sk/'
  url 'http://sid.rstack.org/arp-sk/files/arp-sk-0.0.16.tgz'
  sha1 'c7c0af367640d852f3ff622c5b03096ce4e940a4'

  bottle do
    cellar :any
    sha1 'e4f1ea670b42aece5e303b888293f8403f129dc4' => :mavericks
    sha1 'c799937dcd0929d18d85d95c09400f590e81bc9d' => :mountain_lion
    sha1 '2989958dbae3fa96750cd1995966f06cfeb6cc41' => :lion
  end

  depends_on 'libnet'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--with-libnet=#{HOMEBREW_PREFIX}"
    system "make install"
  end
end
