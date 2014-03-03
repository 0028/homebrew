require 'formula'

class TomeeJaxRs < Formula
  homepage 'http://tomee.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.6.0/apache-tomee-1.6.0-jaxrs.tar.gz'
  version '1.6.0'
  sha1 '1db7d705012f891e9ba7d6487be4fe93ea794ffb'

  bottle do
    cellar :any
    sha1 "65f1efca466777bcca1199cf96c2951e727cea0e" => :mavericks
    sha1 "58a3632dd8f1a0308a2af431cc1a96be5121d99d" => :mountain_lion
    sha1 "7f4516dfb2dd88fa93d7a552fbbdae65697aff62" => :lion
  end

  # Keep log folders
  skip_clean 'libexec'

  def install
    # Remove Windows scripts
    rm_rf Dir['bin/*.bat']

    # Install files
    prefix.install %w{ NOTICE LICENSE RELEASE-NOTES RUNNING.txt }
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/tomee.sh" => "tomee-jax-rs"
  end
end
