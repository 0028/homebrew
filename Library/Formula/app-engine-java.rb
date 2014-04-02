require 'formula'

class AppEngineJava < Formula
  homepage 'https://developers.google.com/appengine/docs/java/gettingstarted/introduction'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.1.zip'
  sha1 'e2bcbf981b3ebcb0639b818e201fe220cadc51d5'

  bottle do
    cellar :any
    sha1 "2aa10163a7c6e10141b54587bcb9e42c61e741bb" => :mavericks
    sha1 "aaa4c8ca3107682f3894d9a915c9c788a3b1aa43" => :mountain_lion
    sha1 "a21006a5c7ad1c8fb74f41c46aee12f653823caa" => :lion
  end

  def install
    rm Dir['bin/*.cmd']
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
