require 'formula'

class Etcd < Formula
  homepage 'https://github.com/coreos/etcd'
  url 'https://github.com/coreos/etcd/archive/v0.3.0.tar.gz'
  sha1 '0f191070268f7c87ca044ad23179995b9290e3c0'
  head 'https://github.com/coreos/etcd.git'

  bottle do
    sha1 "aebe5bbf052979796fd20b40c494ab10b956bd61" => :mavericks
    sha1 "5f372de7ac09fc0f0845b22b4f0ae9c99cc7bb72" => :mountain_lion
    sha1 "6f6a0fbef839925c7eca67467b5181cbf42708d4" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'bin/etcd'
  end
end
