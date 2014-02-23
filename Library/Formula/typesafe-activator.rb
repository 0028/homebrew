require 'formula'

class TypesafeActivator < Formula
  homepage 'http://typesafe.com/activator'
  url 'http://downloads.typesafe.com/typesafe-activator/1.0.13/typesafe-activator-1.0.13.zip'
  sha1 '34e655823a7931c7f61a978c7d9cbd20881267ac'

  bottle do
    sha1 "49c0a8e114b0f1a36a927ef077f5165c512857af" => :mavericks
    sha1 "caf8e312447f94269975a88b0c5e76f9a76c39ce" => :mountain_lion
    sha1 "c000b3415ee73aa3d4d31b5ba4bbd42add5fd31d" => :lion
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
