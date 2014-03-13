require "formula"

class Boot2docker < Formula
  homepage "https://github.com/boot2docker/boot2docker"
  head "https://github.com/boot2docker/boot2docker.git"
  url 'https://github.com/boot2docker/boot2docker/archive/v0.7.0.tar.gz'
  sha1 'd61dc8cdd3b0fd8ce8f8443c4d621f0f87220b0f'

  bottle do
    cellar :any
    sha1 "e6a45a11e551bc797816b2005a3e6ab9bf3440d2" => :mavericks
    sha1 "4077a5d4090851b4246e4f147ea1271d6fda67df" => :mountain_lion
    sha1 "4adb4edd118b03c82665c094f2bd5123c06137a0" => :lion
  end

  depends_on "docker" => :recommended

  def install
    bin.install "boot2docker"
  end
end
