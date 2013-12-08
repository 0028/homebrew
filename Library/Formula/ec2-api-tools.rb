require 'formula'

class Ec2ApiTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/351'
  url 'http://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.6.12.0.zip'
  sha1 'eb0732df59a2ad2c1ad3fa5839e846b69afad697'

  bottle do
    cellar :any
    sha1 '6d48640392ee954b3599edb1f720059d2962b3e0' => :mavericks
    sha1 'b61289a1962d1c94e20826ab91f3b8168b13c3ec' => :mountain_lion
    sha1 '5b1ed5fe7582c6120e821c132fcce412ad7c0a4e' => :lion
  end

  def install
    standard_install
  end

  def caveats
    standard_instructions "EC2_HOME"
  end
end
