require 'formula'

class Lnav < Formula
  homepage 'http://lnav.org'
  url 'https://github.com/tstack/lnav/releases/download/v0.7.0/lnav-0.7.0.tar.gz'
  sha1 '49334f3ffea752b9d7ce846757fc6ff78f123eb5'

  head 'https://github.com/tstack/lnav.git'

  bottle do
    sha1 "8a6f66c027913823bb6cbf274fec3fddf3c6e99d" => :mavericks
    sha1 "1d6bdddc7b5fb2675566bf010b8d22367fe7d91c" => :mountain_lion
    sha1 "de2529bcfcc57b8f244076b3a32082fec75c7648" => :lion
  end

  depends_on 'readline'
  depends_on 'pcre'

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
