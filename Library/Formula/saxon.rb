require 'formula'

class Saxon < Formula
  homepage "http://saxon.sourceforge.net"
  url 'https://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-5J.zip'
  sha1 'bb8476866cacb72e5567bdfc246570e7f0986e48'
  version '9.5.1.5'

  bottle do
    cellar :any
    sha1 "3cf21443be1578fa21f7cd4ba069ff349abffc86" => :mavericks
    sha1 "ab1c484fe120b168ebbb89a0943deabb278b4be9" => :mountain_lion
    sha1 "c6936727d5d3f382a39c2f1bf02e970d73f1214a" => :lion
  end

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'saxon9he.jar', 'saxon'
  end
end
