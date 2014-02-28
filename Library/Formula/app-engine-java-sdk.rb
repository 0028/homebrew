require 'formula'

class AppEngineJavaSdk < Formula
  homepage 'https://developers.google.com/appengine/docs/java/overview'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/appengine-java-sdk-1.9.0.zip'
  sha1 '45fac6746c65641eeaf087c88bc755365c69ef71'

  bottle do
    sha1 "3ca38e6a04cd2c1f23477613db83fbffd622a3f5" => :mavericks
    sha1 "8b58c8203f05794b49f1caf9a2e07117da97fd0f" => :mountain_lion
    sha1 "6e0f937aa65dd965d6e659f7e369201b80742dfc" => :lion
  end

  def install
    rm Dir['bin/*.cmd']
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end
end
