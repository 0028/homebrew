require 'formula'

class TypesafeActivator < Formula
  homepage 'http://typesafe.com/activator'
  url 'http://downloads.typesafe.com/typesafe-activator/1.0.8/typesafe-activator-1.0.8.zip'
  sha1 '4c1bdb0374bf877586de14a5bf15d4d97965bc81'

  bottle do
    sha1 '9d01e1a22fac0218ab5b912dd13efddca20b61c2' => :mavericks
    sha1 'dede86af569f213954c700fb4c39e1a6371d87f8' => :mountain_lion
    sha1 '4e171dd711c000e8d9ac69b00ec54c25f542337a' => :lion
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
