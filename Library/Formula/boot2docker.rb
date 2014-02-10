require "formula"

class Boot2docker < Formula
  homepage "https://github.com/steeve/boot2docker"
  url 'https://github.com/steeve/boot2docker/archive/v0.5.4.tar.gz'
  sha1 '881630491b335230d62a679b8dfbb52c3e249fb8'

  bottle do
    cellar :any
    sha1 "9390eb2df380674c0a2ce94dad723bcbaf8fc06c" => :mavericks
    sha1 "686df36fc50b078e2cc7952699f8e0ed50da5320" => :mountain_lion
    sha1 "0e5034edc3b88be3b0bbdb97c0c5d535a38e4b33" => :lion
  end

  depends_on "docker"

  def install
    bin.install "boot2docker"
  end

  test do
    system "#{bin}/boot2docker", "info"
  end
end
