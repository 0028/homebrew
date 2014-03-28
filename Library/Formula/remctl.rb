require 'formula'

class Remctl < Formula
  homepage 'http://www.eyrie.org/~eagle/software/remctl/'
  url 'http://archives.eyrie.org/software/kerberos/remctl-3.8.tar.gz'
  sha1 '81d142cfeb1efa6582626e0c747139c83837b422'

  bottle do
    sha1 "83f9a3d09ad9a4aeebd39e877827ce5eda1ea79c" => :mavericks
    sha1 "e1c8a776297f594e78e9c2f1cbed63c09cb14206" => :mountain_lion
    sha1 "3a2bb15b64e98164151c29be048f5f588a7471ae" => :lion
  end

  depends_on 'pcre'
  depends_on 'libevent'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-pcre=#{HOMEBREW_PREFIX}"
    system "make install"
  end

  test do
    system "#{bin}/remctl", "-v"
  end
end
