require 'formula'

class Saxon < Formula
  homepage "http://saxon.sourceforge.net"
  url 'http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-3J.zip'
  sha1 'a8cde14c9af99b40e52624253cf19ac4b1c02f16'
  version '9.5.1.3'

  bottle do
    sha1 '846d9ec577fad3a9510f621e74b2ef08f4303a6f' => :mavericks
    sha1 '0379cfdd8eea8f41dece6f8de8c72c72ef36d0be' => :mountain_lion
    sha1 'cf4a44674497842d1480513bb93bbbe4e2e0e0c9' => :lion
  end

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'saxon9he.jar', 'saxon'
  end
end
