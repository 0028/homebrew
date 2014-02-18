require 'formula'

class Grails < Formula
  homepage 'http://grails.org'
  url 'http://dist.springframework.org.s3.amazonaws.com/release/GRAILS/grails-2.3.6.zip'
  sha1 '9f09b73e7f357ce8bf7938590da0a91cbd849ca1'

  bottle do
    cellar :any
    sha1 "f7a8bbd861162de41ebae6e8e1ace87a105f0796" => :mavericks
    sha1 "a4269e1a77bda635966133f82bdbc42ed7d69768" => :mountain_lion
    sha1 "b6ae23fe9f71a879abe3e5788aafe8b63e9e3447" => :lion
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
