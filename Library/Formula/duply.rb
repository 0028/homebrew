require 'formula'

class Duply < Formula
  homepage 'http://duply.net'
  url 'http://downloads.sourceforge.net/project/ftplicity/duply%20(simple%20duplicity)/1.6.x/duply_1.6.0.tgz'
  sha1 '0e376c331b26b64cf1d537b3d9f417eac393fd92'

  bottle do
    cellar :any
    sha1 '7b0953885295469cb2bda33dc333c42606598d7b' => :mavericks
    sha1 '30f4406cd9db1a839d16e3ac45cec0ab1102c8b1' => :mountain_lion
    sha1 '624dedfdd2b9001e3aa027753413cb287d935ae1' => :lion
  end

  depends_on 'duplicity'

  def install
    bin.install 'duply'
  end
end
