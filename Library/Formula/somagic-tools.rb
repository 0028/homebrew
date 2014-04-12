require 'formula'

class SomagicTools < Formula
  homepage 'https://code.google.com/p/easycap-somagic-linux/'
  url 'https://easycap-somagic-linux.googlecode.com/files/somagic-easycap-tools_1.1.tar.gz'
  sha1 'e6bce8395a5c2c70c0c5809251b240a2cf618093'

  bottle do
    cellar :any
    sha1 "72e86253b361df3fb12abd58dfef0dd109568496" => :mavericks
    sha1 "96ed9a3f1fbd98f70f206d210ebb8d7ebb607d9a" => :mountain_lion
    sha1 "0ae2621ec5bcf8c3c461b19d4e181489085bdf56" => :lion
  end

  depends_on 'libusb'
  depends_on 'libgcrypt'

  def install
    system 'make'
    system 'make', 'PREFIX="#{prefix}"', 'install'
  end
end
