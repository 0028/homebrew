require 'formula'

class Scamper < Formula
  homepage 'http://www.caida.org/tools/measurement/scamper/'
  url 'http://www.caida.org/tools/measurement/scamper/code/scamper-cvs-20130824.tar.gz'
  sha1 'c3d5c5bb28fd39020a13d9d7be25e4e5ac0cb05e'

  bottle do
    cellar :any
    sha1 '0e05a358e8d10328f1c57bad5d057d60744ddffe' => :mavericks
    sha1 '47d663f01de9588396f03dce2e444fb58779e5cc' => :mountain_lion
    sha1 '4e523642fbad47a6ac07474c2ed26b4468f79001' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
