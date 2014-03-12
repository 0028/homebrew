require 'formula'

class Camlistore < Formula
  homepage 'http://camlistore.org'
  head 'https://camlistore.googlesource.com/camlistore', :using => :git
  url 'https://github.com/bradfitz/camlistore/archive/0.7.tar.gz'
  sha1 'fae4e18f03f545f6232c24861e1f13c4bb653b34'

  bottle do
    sha1 "671a4994b3763f52038355341ea174c6bc3711a6" => :mavericks
    sha1 "3407b29787dfcc67780e6c09f15d7ed38869a910" => :mountain_lion
    sha1 "782b43d7e6316be64764038738630be3d61aa570" => :lion
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
