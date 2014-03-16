require 'formula'

class Saxon < Formula
  homepage "http://saxon.sourceforge.net"
  url 'https://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-4J.zip'
  sha1 '10910a1ced9c1a485a6084d4a6f1a6793645a798'
  version '9.5.1.4'

  bottle do
    cellar :any
    sha1 "c6cdf7032583582be2d8c7d55074358dcae2dc0a" => :mavericks
    sha1 "1ae3b4f12ea09f5b8875a87f617294fdd4bb6a2c" => :mountain_lion
    sha1 "2965537313ba837485fc581cd86ab5134a8cf78a" => :lion
  end

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'saxon9he.jar', 'saxon'
  end
end
