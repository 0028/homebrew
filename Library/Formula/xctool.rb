require 'formula'

class Xcode5 < Requirement
  fatal true
  satisfy { MacOS::Xcode.version >= "5.0" }
end

class Xctool < Formula
  homepage 'https://github.com/facebook/xctool'
  url 'https://github.com/facebook/xctool/archive/v0.1.15.tar.gz'
  sha1 'bfa6e02ae0fb90294fe653c55e1a7151877319be'
  head 'https://github.com/facebook/xctool.git'

  bottle do
    sha1 "47a1e91e787270c9114e64d223da13f809de0246" => :mavericks
    sha1 "0d26892b8262dcf7108968d14f1f1908b84813da" => :mountain_lion
  end

  depends_on :xcode
  depends_on Xcode5

  def install
    system "./scripts/build.sh", "XT_INSTALL_ROOT=#{libexec}"
    bin.install_symlink "#{libexec}/bin/xctool"
  end

  test do
    system "(#{bin}/xctool -help; true)"
  end
end
