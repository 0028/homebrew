require 'formula'

class TypesafeActivator < Formula
  homepage 'http://typesafe.com/activator'
  url 'http://downloads.typesafe.com/typesafe-activator/1.1.0/typesafe-activator-1.1.0.zip'
  sha1 '1bfc2779c8646f7daac0c3610f77491f65628399'

  bottle do
    cellar :any
    sha1 "d26de544bcc1abd1b481672e32618fadd15d3e04" => :mavericks
    sha1 "47d6c0db618147c6f1a6d10b593aba72b61a7d1e" => :mountain_lion
    sha1 "e4f34962608055b1b6a4539f0c72360617d4a128" => :lion
  end

  def install
    # remove Windows .bat files
    rm Dir['*.bat']
    rm Dir["#{buildpath}/**/*.bat"]

    prefix.install_metafiles

    libexec.install Dir['*']
    bin.write_exec_script libexec/'activator'
  end
end
