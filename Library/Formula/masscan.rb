require 'formula'

class Masscan < Formula
  homepage 'https://github.com/robertdavidgraham/masscan/'
  url 'https://github.com/robertdavidgraham/masscan/archive/1.0.3.tar.gz'
  sha1 'a10a2475e97c7d2b2999e4c9ce9e19863782dc8f'
  head 'https://github.com/kaizoku/masscan.git'

  bottle do
    cellar :any
    sha1 "a6ed76dbdb6b6d0450b257890e08340c98348644" => :mavericks
    sha1 "20ff2aba75033bdd4a797673b24c4a5148b314bf" => :mountain_lion
    sha1 "58033b3f9260761567fc45cacabc79736ab0e37c" => :lion
  end

  def install
    system "make"
    bin.install "bin/masscan"
  end

  test do
    assert `#{bin}/masscan --echo`.include? 'adapter ='
  end
end
