require 'formula'

class Phoon < Formula
  homepage 'http://www.acme.com/software/phoon/'
  url 'http://www.acme.com/software/phoon/phoon_29jun2005.tar.gz'
  version '03A'
  sha1 'd646af184b83e1a4104fe82588daadae2938e08c'

  bottle do
    cellar :any
    sha1 '115f30476dca3df51a65d94df6222af712113fc2' => :mavericks
    sha1 '3fa5c11bbe8f71790a4f038c1d71efc4cf383906' => :mountain_lion
    sha1 '93432df9aaeca0417f075a8ed879c70d58072a5d' => :lion
  end

  def install
    system "make"
    bin.install('phoon')
    man1.install('phoon.1')
  end
end
