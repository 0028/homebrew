require 'formula'

class JbossForge < Formula
  homepage 'http://forge.jboss.org/'
  url 'https://repository.jboss.org/nexus/service/local/artifact/maven/redirect?r=releases&g=org.jboss.forge&a=forge-distribution&v=1.4.4.Final&e=zip'
  version '1.4.4.Final'
  sha1 '7c5218f9ed9c2e4986ee450f3c958d78dc3c09fd'

  bottle do
    cellar :any
    sha1 "d0e2e37ef55e54525d8f5bf90ff0ebeb56aeefcc" => :mavericks
    sha1 "df61797f53c31b563afc7566cdea34765e8e982e" => :mountain_lion
    sha1 "64a31d8cb6ea3381f02c915f3dd9b8233e4b46e6" => :lion
  end

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w{ bin modules jboss-modules.jar }
    bin.install_symlink libexec/'bin/forge'
  end
end
