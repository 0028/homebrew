require 'formula'

class ProxychainsNg < Formula
  homepage 'https://sourceforge.net/projects/proxychains-ng'
  url 'http://downloads.sourceforge.net/project/proxychains-ng/proxychains-4.7.tar.bz2'
  sha1 '5e5b10009f785434ebdbd7ede5a79efee4e59c5a'

  head 'https://github.com/rofl0r/proxychains-ng.git'

  bottle do
    sha1 '6d5f20fbd68a13fe1f8cd6f0c2d69c7ecfd49b94' => :mavericks
    sha1 '851f94c1fb1779ab1b8b383aecbc3eb52c1ab754' => :mountain_lion
    sha1 '5d81abfd9e9fe849e735ba3c3178d6c0bf99ed3a' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--sysconfdir=#{prefix}/etc"
    system "make"
    system "make install"
    system "make install-config"
  end
end
