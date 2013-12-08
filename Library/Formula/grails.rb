require 'formula'

class Grails < Formula
  homepage 'http://grails.org'
  url 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.3.4.zip'
  sha1 '13c39936f1b820ebb13e03fd56cc617b0c68eaee'

  bottle do
    cellar :any
    sha1 'f245a83396986e000f24feeefb768aced167fa86' => :mavericks
    sha1 'e8961f0218f4a7586c53fef864114bb75aefe910' => :mountain_lion
    sha1 '2c810fc74be7ff88055d75dcf5c65da3ed4cd372' => :lion
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
