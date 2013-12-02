require 'formula'

class Etcd < Formula
  homepage 'https://github.com/coreos/etcd'
  url 'https://github.com/coreos/etcd/archive/v0.1.2.tar.gz'
  sha1 'f6a644ec0ff30681b816bff192a881ed65d0c9e5'
  head 'https://github.com/coreos/etcd.git'

  bottle do
    sha1 '8725d957ee466475d44464a655d5ce66d4a9b255' => :mavericks
    sha1 '7e413d07d3492d9f7b9fae32c9a973850ecf0ff8' => :mountain_lion
    sha1 '8f606fb56f0529a64f16b6c49f7f58bd1e203983' => :lion
  end

  depends_on 'go' => :build

  fails_with :clang do
    cause "clang: error: no such file or directory: 'libgcc.a'"
  end

  def install
    ENV['GOPATH'] = buildpath
    system "./build"
    bin.install 'etcd'
  end
end
