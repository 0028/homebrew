require 'formula'

class Batik < Formula
  homepage 'https://xmlgraphics.apache.org/batik/'
  url 'http://www.us.apache.org/dist/xmlgraphics/batik/batik-1.7.zip'
  sha1 '69d974ab0a4e13cbdd649fa96785776563b73fcf'

  bottle do
    sha1 '8f1480e49cf2f23982464e46e0331b0461724d95' => :mavericks
    sha1 '20b6c2a27e2b48aa86fc97c0e75440eaa9ff2f99' => :mountain_lion
    sha1 '9b1b205b47eef3f9503b793a440ed4199b95cdd7' => :lion
  end

  def install
    doc.install Dir['docs/*']
    libexec.install 'lib', Dir['*.jar']

    bin.write_jar_script libexec/'batik-rasterizer.jar', 'batik-rasterizer'
    bin.write_jar_script libexec/'batik.jar', 'batik'
    bin.write_jar_script libexec/'batik-ttf2svg.jar', 'batik-ttf2svg'
  end
end
