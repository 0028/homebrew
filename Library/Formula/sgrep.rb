require 'formula'

class Sgrep < Formula
  homepage 'http://www.cs.helsinki.fi/u/jjaakkol/sgrep.html'
  url 'ftp://ftp.cs.helsinki.fi/pub/Software/Local/Sgrep/sgrep-1.94a.tar.gz'
  sha1 '4f6815d212ac6e1ed4eb2720f9b28963d1d0e99d'

  bottle do
    sha1 'fc2052380feaaa3f0a3a96516e464edfe43e3afd' => :mavericks
    sha1 '7b33dd0ac45611338b16db63b8529a228c4cfb07' => :mountain_lion
    sha1 '3e18d2e3173b1f870108095c76763b5b8f4f621a' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--datadir=#{share}/sgrep"
    system "make install"
  end
end
