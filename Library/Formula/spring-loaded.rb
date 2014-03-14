require 'formula'

class SpringLoaded < Formula
  homepage 'https://github.com/spring-projects/spring-loaded'
  url 'http://dist.springframework.org/snapshot/SPRING-LOADED/springloaded-1.1.5.RELEASE.jar', :using => :nounzip
  sha1 'abde10d9955f27d4a3141005c177012668565846'
  version '1.1.5'

  bottle do
    cellar :any
    sha1 "91deba4a48c0d593b6ee302bc7d4f967b8ef491d" => :mavericks
    sha1 "e10143aa4114cfa35c13390fa4706dcbd44415d2" => :mountain_lion
    sha1 "6058db18f17563efc285eec578e98ee7ee4c576e" => :lion
  end

  def install
    (share/'java').install 'springloaded-1.1.5.RELEASE.jar' => 'springloaded.jar'
  end

  test do
    system "java", "-javaagent:#{share}/java/springloaded.jar", "-version"
  end
end
