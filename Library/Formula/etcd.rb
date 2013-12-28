require 'formula'

class Etcd < Formula
  homepage 'https://github.com/coreos/etcd'
  url 'https://github.com/coreos/etcd/archive/v0.2.0.tar.gz'
  sha1 'c18bfe533a5c180012188e4039b740b9564894ce'
  head 'https://github.com/coreos/etcd.git'

  bottle do
    sha1 '8c892b35dd84ba84443fbd55d4e37f5f89a13082' => :mavericks
    sha1 '56756cdd1ddcf77c2227d15c4eb97f52179c633a' => :mountain_lion
    sha1 '4965569843ed4bd641bec64de9df23421f979dbc' => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'etcd'
  end
end
