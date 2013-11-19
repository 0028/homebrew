require 'formula'

class Saxon < Formula
  homepage "http://saxon.sourceforge.net"
  url 'http://downloads.sourceforge.net/project/saxon/Saxon-HE/9.5/SaxonHE9-5-1-3J.zip'
  sha1 'a8cde14c9af99b40e52624253cf19ac4b1c02f16'
  version '9.5.1.3'

  bottle do
    sha1 'cb0a3360d592d64b73d68e8f8748e0b5f29ba474' => :mavericks
    sha1 'aeb87ed9082617615331a6e447a58ee24744d86a' => :mountain_lion
    sha1 '3e968adcd338dd118e5692fa9d2986440fcd66fc' => :lion
  end

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'saxon9he.jar', 'saxon'
  end
end
