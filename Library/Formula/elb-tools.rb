require 'formula'

class ElbTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/2536'
  url 'http://ec2-downloads.s3.amazonaws.com/ElasticLoadBalancing.zip'
  version '1.0.33.0'
  sha1 '4415660b6104b02f1f91ac7528a231ef7661d543'

  bottle do
    cellar :any
    sha1 "50c418a9c3e5716230ed6cb7e51164276fdbd81a" => :mavericks
    sha1 "6ce26bd3400b69ada86a1844349d72da80326d55" => :mountain_lion
    sha1 "a852e1bf4aa1c4965fb7d6759dacfd2f90f104e0" => :lion
  end

  depends_on 'ec2-api-tools'

  def install
    standard_install
  end

  def caveats
    standard_instructions "AWS_ELB_HOME"
  end
end
