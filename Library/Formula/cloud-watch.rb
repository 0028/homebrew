require 'formula'

class CloudWatch < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/2534'
  url 'http://ec2-downloads.s3.amazonaws.com/CloudWatch-2010-08-01.zip'
  version '1.0.20.0'
  sha1 'c3f5b856b3ff8e1ae06d0ad5db5dd27c214c4881'

  bottle do
    cellar :any
    sha1 "01516c1ad96f478d54124fc97c8e8e415780cdaa" => :mavericks
    sha1 "3dcae59ddd421e972318dd63dbb8be91ec07c5a7" => :mountain_lion
    sha1 "4731ecdb378410d9b91e616b6325830154b94896" => :lion
  end

  def install
    standard_install
  end

  def caveats
    s = standard_instructions "AWS_CLOUDWATCH_HOME"
    s += <<-EOS.undent
      export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
    EOS
    return s
  end
end
