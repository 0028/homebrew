require 'formula'

class Batik < Formula
  homepage 'https://xmlgraphics.apache.org/batik/'
  url 'http://www.us.apache.org/dist/xmlgraphics/batik/batik-1.7.zip'
  sha1 '69d974ab0a4e13cbdd649fa96785776563b73fcf'

  bottle do
    sha1 'e8c125cc23b3c1f6ea8282fc372c2fc3470c61e6' => :mavericks
    sha1 '1404fcf6509f2648ca775a24f28e97ed41be9aa0' => :mountain_lion
    sha1 '17a265ed78e2d56a1695235e055a060a60b3521d' => :lion
  end

  def install
    doc.install Dir['docs/*']

    libexec.install Dir['*.jar']
    libexec.install 'lib'

    bin.write_jar_script libexec/'batik-rasterizer.jar', 'batik-rasterizer'
    bin.write_jar_script libexec/'batik.jar', 'batik'
  end

end
