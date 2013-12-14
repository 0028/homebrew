require 'formula'

class Camlistore < Formula
  homepage 'http://camlistore.org'
  head 'https://camlistore.googlesource.com/camlistore', :using => :git
  url 'https://github.com/bradfitz/camlistore/archive/0.5.tar.gz'
  sha1 'f089410910cdf8c79ab2cf5ac377f2ccbaafe618'

  bottle do
    sha1 '8e59dd83f293efb476b97a3f1f1db7e27bb63c46' => :mavericks
    sha1 'ad0acaa401ffbc2ee9a7cf4697662d265ffe0fc0' => :mountain_lion
    sha1 'ac7734ae83b7e0d167912167948957aa09130ea6' => :lion
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
