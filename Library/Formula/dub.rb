require 'formula'

class Dub < Formula
  homepage 'http://registry.vibed.org/'
  url  'https://github.com/rejectedsoftware/dub/archive/v0.9.20.tar.gz'
  sha1 '9fb51e7daf93153d81b2fb7e6e72654c0c19a501'

  head 'https://github.com/rejectedsoftware/dub.git'

  bottle do
    sha1 'c676aa57f44d5102d9d29fb8fb09c1e5f07e2f8a' => :mavericks
    sha1 '5de11a109e91eb465239a825ea31cdeef60ea760' => :mountain_lion
    sha1 '1e06d315c348a5bb31cd19a2830403819ef1de11' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'dmd'  => :build

  def install
    system "./build.sh"
    bin.install 'bin/dub'
  end

  test do
    system "#{bin}/dub; true"
  end
end
