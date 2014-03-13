require 'formula'

class Ec2AmiTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/368'
  url 'http://ec2-downloads.s3.amazonaws.com/ec2-ami-tools-1.5.1.zip'
  sha1 '65deb85e452a3341ff12204db8eba0dcfd9db6a3'

  bottle do
    cellar :any
    sha1 "cee1347f7e76530f8d6f91fa18af668e2ae930b0" => :mavericks
    sha1 "8950a0d4b051717ccbc6c6ae265f13e29e1a3a5f" => :mountain_lion
    sha1 "3eef20225a85f30ad2eff8bfcc760110c41f74d0" => :lion
  end

  def install
    standard_install
  end

  def caveats
    standard_instructions "EC2_AMITOOL_HOME"
  end
end
