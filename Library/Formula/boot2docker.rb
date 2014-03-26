require "formula"

class Boot2docker < Formula
  homepage "https://github.com/boot2docker/boot2docker"
  head "https://github.com/boot2docker/boot2docker.git"
  url 'https://github.com/boot2docker/boot2docker/archive/v0.7.1.tar.gz'
  sha1 '447ab4bd75d31654f93e546bab20a9ba6e1a4dcd'

  bottle do
    cellar :any
    sha1 "ae84ece9414d3b8939da22464b6c60a9c98d755f" => :mavericks
    sha1 "d05912fa836f5de136c2f5b937a5423031d838fa" => :mountain_lion
    sha1 "a2dace030aa802bd9e85ca2aed6323f9efc8aacd" => :lion
  end

  depends_on "docker" => :recommended

  def install
    bin.install "boot2docker"
  end
end
