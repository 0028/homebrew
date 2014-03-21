require 'formula'

class Ykclient < Formula
  homepage 'http://yubico.github.io/yubico-c-client/'
  url 'http://yubico.github.io/yubico-c-client/releases/ykclient-2.12.tar.gz'
  sha1 '518ce53ba9ef61a619f9150778f19fad23014a9c'

  bottle do
    cellar :any
    sha1 "164c03e105ba955ce29dae3403f4318e10567ecd" => :mavericks
    sha1 "060f75b95761d4640645c18df6c189ca291ecd80" => :mountain_lion
    sha1 "b6a9d202a783cf884a5068b28a1e9cdb4bce5093" => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'help2man' => :build

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
