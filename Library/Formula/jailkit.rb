require 'formula'

class Jailkit < Formula
  homepage 'http://olivier.sessink.nl/jailkit/'
  url 'http://olivier.sessink.nl/jailkit/jailkit-2.17.tar.bz2'
  sha1 '757891cc8915a133087164aa19719fef82f809ef'

  bottle do
    sha1 '49e2faa18ca11662f1491475f2621e6fbd8fe82e' => :mavericks
    sha1 'cfc8706185ae0eb8855fa79936bc087e7e59a98f' => :mountain_lion
    sha1 '1340856a79a414bc695285609b9bf7b19778d3d6' => :lion
  end

  def install
      system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
      system "make install"
  end
end
