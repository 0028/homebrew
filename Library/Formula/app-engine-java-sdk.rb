require 'formula'

class AppEngineJavaSdk < Formula
  homepage 'https://developers.google.com/appengine/docs/java/overview'
  url 'http://googleappengine.googlecode.com/files/appengine-java-sdk-1.8.9.zip'
  sha1 '9c73b9b200723cf288b027d22c89ff231229d822'

  bottle do
    sha1 '58d2ba14f373abe68115caad8c77b9a2f367fd14' => :mavericks
    sha1 '9191fdd32febca417c2bb1b5931d03652e4e8618' => :mountain_lion
    sha1 '8fb5f73847f4812b8025901564027e712fa4c726' => :lion
  end

  def install
    rm Dir['bin/*.cmd']
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
