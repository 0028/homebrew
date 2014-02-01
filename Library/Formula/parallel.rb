require 'formula'

class Parallel < Formula
  homepage 'http://savannah.gnu.org/projects/parallel/'
  url 'http://ftpmirror.gnu.org/parallel/parallel-20140122.tar.bz2'
  bottle do
    cellar :any
    sha1 "39462ca40f0f0fcabe7986880f9486629af3a3ce" => :mavericks
    sha1 "bf39ebf8103f9299293b3f2b755dd46cf9abcfb0" => :mountain_lion
    sha1 "f40901aa16ecb087eacb85a2610ee5e795cda9c3" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/parallel/parallel-20140122.tar.bz2'
  sha256 'b18339bba65f9b2e287ec934d05c12e8103c2c83bc7f9b3c06f6648ecf15c79f'

  conflicts_with 'moreutils',
    :because => "both install a 'parallel' executable."

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
