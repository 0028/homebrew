require 'formula'

class Ec2ApiTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/351'
  url 'http://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.6.12.0.zip'
  sha1 'eb0732df59a2ad2c1ad3fa5839e846b69afad697'

  bottle do
    cellar :any
    sha1 '9d609e35111826fce173e38f4e63b9ef467c6e54' => :mavericks
    sha1 '252aa29b25ed1be04b361ccb0748b6c416e303f2' => :mountain_lion
    sha1 '37f3b29ef418a3f1a5ccc5e61d2c3ebe68e14bdf' => :lion
  end

  def install
    standard_install
  end

  def caveats
    standard_instructions "EC2_HOME", prefix
  end
end
