require 'formula'

class TomeeWebprofile < Formula
  homepage 'http://tomee.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.6.0/apache-tomee-1.6.0-webprofile.tar.gz'
  version '1.6.0'
  sha1 '7a13d9e3b3b66b7dd2f51ab3267f2709fc6e8424'

  bottle do
    cellar :any
    sha1 'a4c26c4011807a545c038a5b687f4498c95038be' => :mavericks
    sha1 'b29b4a049ae85c13cb92371dab540d169b5394e6' => :mountain_lion
    sha1 '4e26f2dbfc6b19b703fdb9ad115deeb43b0ef8a9' => :lion
  end

  # Keep log folders
  skip_clean 'libexec'

  def install
    # Remove Windows scripts
    rm_rf Dir['bin/*.bat']

    # Install files
    prefix.install %w{ NOTICE LICENSE RELEASE-NOTES RUNNING.txt }
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/tomee.sh" => "tomee-webprofile"
  end
end
