require 'formula'

class Ec2ApiTools < AmazonWebServicesFormula
  homepage 'http://aws.amazon.com/developertools/351'
  url 'http://ec2-downloads.s3.amazonaws.com/ec2-api-tools-1.6.12.2.zip'
  sha1 '96bea739ee32326c6826fe22ab778320fde841a4'

  bottle do
    cellar :any
    sha1 "d5c96c06cf1d7fd475f9f379770d1b4fc32b3cea" => :mavericks
    sha1 "4173e1186836239cbb27a19ef6530597c981ef44" => :mountain_lion
    sha1 "a1b7683da9c73d6aa7d214739c47445a1cee7488" => :lion
  end

  def install
    standard_install
  end

  def caveats
    standard_instructions "EC2_HOME"
  end
end
