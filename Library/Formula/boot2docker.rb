require "formula"

class Boot2docker < Formula
  homepage "https://github.com/boot2docker/boot2docker"
  head "https://github.com/boot2docker/boot2docker.git"
  url 'https://github.com/boot2docker/boot2docker/archive/v0.8.0.tar.gz'
  sha1 'c6f07db7d3a4952f1508b92f8b32e02e2f316f85'

  bottle do
    cellar :any
    sha1 "2dab19c13099b501eb4bd4c1e28965cfefbf19fd" => :mavericks
    sha1 "56a1c09e2b837b1c156e9ec1975a1bcb59711045" => :mountain_lion
    sha1 "fbdbc47ce0ed20071a9b997b7d073761c91da27b" => :lion
  end

  depends_on "docker" => :recommended

  def install
    bin.install "boot2docker"
  end
end
