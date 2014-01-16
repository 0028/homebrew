require 'formula'

class Grails < Formula
  homepage 'http://grails.org'
  url 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.3.5.zip'
  sha1 '32a7acbabb22d6d78898f109a3b265ba83589a1b'

  bottle do
    cellar :any
    sha1 '579b25641638da9cb6e146cf4b350e36902b11c6' => :mavericks
    sha1 '21741b378472c2f70da6ad23727de7f6fedde40b' => :mountain_lion
    sha1 'a0913a24d5b39c1106f010da4e56898d9dc10a42' => :lion
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
