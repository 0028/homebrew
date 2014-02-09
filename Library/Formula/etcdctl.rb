require 'formula'

class Etcdctl < Formula
  homepage 'https://github.com/coreos/etcdctl'
  url 'https://github.com/coreos/etcdctl/archive/v0.3.0.tar.gz'
  sha1 '3bc5fae34d40c1717e82a7af4ed177c62dbe22af'
  head 'https://github.com/coreos/etcdctl.git'

  bottle do
    sha1 "a5cca1e2eb5b0aaae49cc4f26ff0d9fe32c1467e" => :mavericks
    sha1 "feb89bc282993c253f8b27c79bed4b6ab23624f0" => :mountain_lion
    sha1 "bcbd098008659960d8effa7d2e0ac03413ddc384" => :lion
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'bin/etcdctl'
  end
end
