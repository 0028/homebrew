require 'formula'

class Rancid < Formula
  homepage 'http://www.shrubbery.net/rancid/'
  url 'ftp://ftp.shrubbery.net/pub/rancid/rancid-2.3.8.tar.gz'
  sha1 '7469d7f9e39e9f86f977f1f0963300e5d183088f'

  bottle do
    sha1 "1789b63dfea664c4348ccd1943b7be4d3a55fa75" => :mavericks
    sha1 "5b3af21c2deb5dd6a13cdf5f03202d685e244270" => :mountain_lion
    sha1 "bbd59ef83d44703653d66abf9787e3e9cfdff77d" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--exec-prefix=#{prefix}", "--mandir=#{man}"
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/rancid", "localhost"
  end
end
