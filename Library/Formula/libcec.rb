require 'formula'

class Libcec < Formula
  homepage 'http://libcec.pulse-eight.com/'
  url 'https://github.com/Pulse-Eight/libcec/archive/libcec-2.1.4.tar.gz'
  sha1 '3ee241201b3650b97ec4fc41b0f5dd33476080f9'

  bottle do
    cellar :any
    sha1 "e407a524e1fbebefac7fc5f77e313bfd05bec23d" => :mavericks
    sha1 "a604ea61aa83adab30fd0e356a1d51952f68d1c0" => :mountain_lion
    sha1 "cf82b90968203972979ddff06594b25c6dd7477a" => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'pkg-config' => :build

  def install
    system "./bootstrap"
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/cec-client", "--info"
  end
end
