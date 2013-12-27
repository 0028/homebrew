require 'formula'

class Camlistore < Formula
  homepage 'http://camlistore.org'
  head 'https://camlistore.googlesource.com/camlistore', :using => :git
  url 'https://github.com/bradfitz/camlistore/archive/0.6.tar.gz'
  sha1 'ca2a530fb2eb39a6cecf2f60e290934a9b6414f4'

  bottle do
    sha1 'c7e7c1a9d23824fc83a8808a15c397f01e62d568' => :mavericks
    sha1 '469a4590d427509ea348c9919ed3fc0ee8a705c5' => :mountain_lion
    sha1 '79ecd652cf0046ed784414c6404ddf6dbcc0467b' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'go' => :build
  depends_on 'sqlite'

  def install
    ENV['GIT_DIR'] = cached_download+".git"

    system "go", "run", "make.go"
    prefix.install "bin/README"
    prefix.install "bin"
  end

  test do
    system bin/"camget", "-version"
  end
end
