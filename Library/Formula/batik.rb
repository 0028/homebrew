require 'formula'

class Batik < Formula
  homepage 'https://xmlgraphics.apache.org/batik/'
  url 'http://www.us.apache.org/dist/xmlgraphics/batik/batik-1.7.zip'
  sha1 '69d974ab0a4e13cbdd649fa96785776563b73fcf'

  def install
    doc.install Dir['docs/*']

    libexec.install Dir['*.jar']
    libexec.install 'lib'

    bin.write_jar_script Dir[libexec/'batik-rasterizer.jar'].first, 'batik-rasterizer'
    bin.write_jar_script Dir[libexec/'batik.jar'].first, 'batik'
  end

end
