require 'formula'

class RubyInstall < Formula
  homepage 'https://github.com/postmodern/ruby-install#readme'
  url 'https://github.com/postmodern/ruby-install/archive/v0.3.3.tar.gz'
  sha1 '9a7a5a8890468acf3d507cca5a2bdb9a53383726'

  head 'https://github.com/postmodern/ruby-install.git'

  bottle do
    cellar :any
    sha1 'fab440c336a5fe1cd01ad4271afc76c5c220230e' => :mavericks
    sha1 '3b52a27efd3de1e5dab9647f5d7e0c4cdb84a8d4' => :mountain_lion
    sha1 '036e7ae3f4d36bf90342691be4b6203c299520e9' => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end
end
