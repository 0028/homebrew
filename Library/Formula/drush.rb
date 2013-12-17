require 'formula'

class Drush < Formula
  homepage 'https://github.com/drush-ops/drush'
  head 'https://github.com/drush-ops/drush.git'
  url 'https://github.com/drush-ops/drush/archive/6.2.0.tar.gz'
  sha1 '7e13d5264f362ec09efbe8218e13dcd646ba75b3'

  bottle do
    cellar :any
    sha1 '1ef9cd9d575f0e9091daead070ed8c706ee2c00f' => :mavericks
    sha1 '505cdd72795339cc11d806f0489927e08fac2e2f' => :mountain_lion
    sha1 'a957d8f3b14b677f3c219cb7ad66ce914fe29fbe' => :lion
  end

  def install
    prefix.install_metafiles
    libexec.install Dir['*'] -['drush.bat']
    bin.install_symlink libexec/'drush'
    bash_completion.install libexec/'drush.complete.sh' => 'drush'
  end
end
