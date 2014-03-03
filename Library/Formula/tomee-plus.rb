require 'formula'

class TomeePlus < Formula
  homepage 'http://tomee.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.6.0/apache-tomee-1.6.0-plus.tar.gz'
  version '1.6.0'
  sha1 'f6751c837c7dc7e60b72ea84b1f425f71d79b926'

  bottle do
    cellar :any
    sha1 "4e76c81396a8b94f62f1a9b101421eace6d57bb9" => :mavericks
    sha1 "4509cec0494ac05b3d0ff321243fb2a84758bf7f" => :mountain_lion
    sha1 "6eb94af166961aa8be16501e7292a0c98b1b1df7" => :lion
  end

  # Keep log folders
  skip_clean 'libexec'

  def install
    # Remove Windows scripts
    rm_rf Dir['bin/*.bat']

    # Install files
    prefix.install %w{ NOTICE LICENSE RELEASE-NOTES RUNNING.txt }
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/tomee.sh" => "tomee-plus"
  end
end
