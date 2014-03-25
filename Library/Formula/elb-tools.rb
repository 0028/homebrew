require 'formula'

class ElbTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/2536'
  url 'http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip'
  version '1.0.34.0'
  sha1 '3d2c30a8fe8294a51463aac6ec926b908cc11f4a'

  bottle do
    cellar :any
    sha1 "7e19bca612cdcf8bee2889c5dc6a8ac8e260aad6" => :mavericks
    sha1 "3eb114c37a2dad2aa76eede5e44c7800264cf3a0" => :mountain_lion
    sha1 "de5130d23efba14296f3b9989783efc351d41bc8" => :lion
  end

  depends_on 'ec2-api-tools'

  def install
    standard_install
  end

  def caveats
    standard_instructions "AWS_ELB_HOME"
  end
end
