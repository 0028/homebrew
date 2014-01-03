require 'formula'

class AutoScaling < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/2535'
  url 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'
  bottle do
    cellar :any
    sha1 'ccdb5fb55694596cd3ecfb00b21c09e8f6d3bc5a' => :mavericks
    sha1 'b913667367308ce444e14102623eb4cd1a73f04c' => :mountain_lion
    sha1 '9cf441c35665b1159407fabf4d852a95a574aee3' => :lion
  end

  version  '1.0.61.4'
  sha1 'a01b92d88f70a17ad2ecf6d254d31053eba3cf57'

  def install
    standard_install
  end

  def caveats
    standard_instructions "AWS_AUTO_SCALING_HOME"
  end
end
