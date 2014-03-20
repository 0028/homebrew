require 'formula'

class AppEngineJavaSdk < Formula
  homepage 'https://developers.google.com/appengine/docs/java/gettingstarted/introduction'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.1.zip'
  sha1 'e2bcbf981b3ebcb0639b818e201fe220cadc51d5'

  bottle do
    cellar :any
    sha1 "8d7f1b4108c632afb7b178b3fb0724c96a44f7a1" => :mavericks
    sha1 "c16228ff732e412930d44113fc326fe188f7196d" => :mountain_lion
    sha1 "5f7c700ce97d8bca3c6c78186a28e3cbe5d86b7b" => :lion
  end

  def install
    rm Dir['bin/*.cmd']
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
