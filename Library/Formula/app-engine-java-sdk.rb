require 'formula'

class AppEngineJavaSdk < Formula
  homepage 'https://developers.google.com/appengine/docs/java/gettingstarted/introduction'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.3.zip'
  sha1 '4f62f99c7be21637903b312ba4431c6222bfca16'

  bottle do
    cellar :any
    sha1 "72be87275b0ef9894c5c75b767c17dee1c58da88" => :mavericks
    sha1 "965303ac9e28f7b2e07a07f2c90bf2a8bca8587e" => :mountain_lion
    sha1 "3fe7e7daae87ea400ed6df6489d42d472d57ff85" => :lion
  end

  def install
    rm Dir['bin/*.cmd']
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
