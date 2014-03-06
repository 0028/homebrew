require 'formula'

class Grails < Formula
  homepage 'http://grails.org'
  url 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.3.7.zip'
  sha1 '295f37fe989e8b3784258fcc14d2749737d8a2d0'

  bottle do
    cellar :any
    sha1 "42e9f1a42e3ca3c3a4f0ba2df2a86d2cd8673c2d" => :mavericks
    sha1 "f427ded4db11d2b45a13efca8b77d2d06738a5b6" => :mountain_lion
    sha1 "2496689a5a7f82df2abe7181ce934400177f4261" => :lion
  end

  def install
    rm_f Dir["bin/*.bat", "bin/cygrails", "*.bat"]
    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats; <<-EOS.undent
    The GRAILS_HOME directory is:
      #{opt_prefix}/libexec
    EOS
  end
end
