require 'formula'

class Xctool < Formula
  homepage 'https://github.com/facebook/xctool'
  url 'https://github.com/facebook/xctool/archive/v0.1.14.tar.gz'
  sha1 '57e610081b781b19ec0c0f2ca81d897b708826f4'
  head 'https://github.com/facebook/xctool.git'

  bottle do
    sha1 'f049b19c3d580b9c071ce14d7778d5692ec17553' => :mavericks
    sha1 'f54cb8cdcf32200596c8e32acbcd3c3656989560' => :mountain_lion
    sha1 '8065cf0c17c812166c49d0422a0baded85cf7994' => :lion
  end

  depends_on :xcode
  depends_on :macos => :lion

  def install
    system "./scripts/build.sh 'XT_INSTALL_ROOT=#{libexec}'"
    bin.install_symlink "#{libexec}/bin/xctool"
  end

  test do
    system "(#{bin}/xctool -help; true)"
  end
end
