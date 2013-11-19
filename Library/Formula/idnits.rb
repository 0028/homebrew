require 'formula'

class Idnits < Formula
  homepage 'http://tools.ietf.org/tools/idnits/'
  url 'http://tools.ietf.org/tools/idnits/idnits-2.13.00.tgz'
  sha1 '25a390110679257706b2498f6519963b4f75d867'

  bottle do
    cellar :any
    sha1 '36103b502578ed8ff74b3726784279c3923af418' => :mavericks
    sha1 '4c2a84077051ae3232ea3bcd0084351736a77cfc' => :mountain_lion
    sha1 '57a5642ffb8ae81142ccf73b20d015eccf00ed5b' => :lion
  end

  depends_on 'aspell'

  def install
    bin.install "idnits"
    prefix.install_metafiles
  end
end
