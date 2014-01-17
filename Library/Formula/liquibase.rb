require 'formula'

class Liquibase < Formula
  homepage 'http://liquibase.org'
  url 'http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.1.1-bin.tar.gz'
  sha1 '48af02bd837eab401236963c5868fc4dae5dfbee'

  bottle do
    cellar :any
    sha1 '08d5188a9f0c902e616bf6d033b2ec2fabf3bdbe' => :mavericks
    sha1 '3c31181829e1a0c024164c6bf1a19df791e80cf9' => :mountain_lion
    sha1 'f92d644cb2e533c10ed465eefdaacf7b840bc2d9' => :lion
  end

  def install
    rm_f Dir['*.bat']

    chmod 0755, Dir['liquibase']

    prefix.install_metafiles
    libexec.install Dir['*']
    bin.install_symlink libexec+'liquibase'
  end

  def caveats
    <<-EOS.undent
      You should set the environment variable LIQUIBASE_HOME to
        #{libexec}
    EOS
  end

  test do
    system "#{bin}/liquibase", "--version"
  end
end
