require 'formula'

class Dub < Formula
  homepage 'http://registry.vibed.org/'
  url  'https://github.com/rejectedsoftware/dub/archive/v0.9.19.tar.gz'
  sha1 'dcf880029190180a1a4a4753237c0eb164941c98'

  head 'https://github.com/rejectedsoftware/dub.git'

  bottle do
    sha1 '54869f765f386ffc20bdbb511109ca4ac4ee380c' => :mavericks
    sha1 'ff98480251d0c50730769e0ea6e3be5ce6073c0a' => :mountain_lion
    sha1 'f0394dece6d8d230a372625f7261c4694d6ea02e' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'dmd'  => :build

  # patch is in upstream master
  def patches
    [
      "https://github.com/rejectedsoftware/dub/commit/0e91afd52babf96128be43120dfd5f9a38b4d202.patch",
      "https://github.com/rejectedsoftware/dub/commit/b08454b6baa5c7e9e2d5a21c943c21cb986fff23.patch",
    ]
  end

  def install
    system "./build.sh"
    bin.install 'bin/dub'
  end

  test do
    system "#{bin}/dub; true"
  end
end
