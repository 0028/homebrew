require 'formula'

class Msktutil < Formula
  homepage 'https://code.google.com/p/msktutil/'
  url 'https://msktutil.googlecode.com/files/msktutil-0.5.1.tar.bz2'
  sha1 '26cceb7dcad17d73bf9fc1f6a3fef9298e465c91'

  bottle do
    cellar :any
    sha1 'f3f06805bcb7dfaa041a2e51bc928553fd34c1ba' => :mavericks
    sha1 '1f747a577622372973f59be1e76de01784be6045' => :mountain_lion
    sha1 '229742473c1dac9e8e9064f9c3794a594d9730cf' => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end
end
