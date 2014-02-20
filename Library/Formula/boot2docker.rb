require "formula"

class Boot2docker < Formula
  homepage "https://github.com/boot2docker/boot2docker"
  url 'https://github.com/boot2docker/boot2docker/archive/v0.5.4.tar.gz'
  sha1 '881630491b335230d62a679b8dfbb52c3e249fb8'

  head "https://github.com/boot2docker/boot2docker.git"

  bottle do
    cellar :any
    sha1 "4ae8b77466d9826d186e6d52291c87382f6e4e4d" => :mavericks
    sha1 "a4c5ccfa74fd92991da1d16d9e164786ae453208" => :mountain_lion
    sha1 "0d070ad33a45821e3fda9aed2924911fd03cae17" => :lion
  end

  depends_on "docker" => :recommended

  def install
    bin.install "boot2docker"
  end

  test do
    system "#{bin}/boot2docker", "info"
  end
end
