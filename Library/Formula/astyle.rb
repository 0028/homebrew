require 'formula'

class Astyle < Formula
  homepage 'http://astyle.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/astyle/astyle/astyle%202.04/astyle_2.04_macosx.tar.gz'
  sha1 '2aa956c4521a1163da6a8be741786fd89c1f39a7'

  bottle do
    cellar :any
    sha1 '47bdb9eced8320d89012a4409de55f75f5eb3b1e' => :mavericks
    sha1 'c9de2b2e2a06018fb1c4447248114df0d1a9338a' => :mountain_lion
    sha1 'd243f0c2cb4424420d7c61e8047f5296db00de0d' => :lion
  end

  def install
    cd 'src' do
      system "make", "CXX=#{ENV.cxx}", "-f", "../build/mac/Makefile"
      bin.install "bin/astyle"
    end
  end
end
