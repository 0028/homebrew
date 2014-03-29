require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.7.2.tar.gz'
  sha1 '316417a29b2e8d44111f2bc63c6503ed08bddf9c'

  head 'https://github.com/lra/mackup.git'

  bottle do
    cellar :any
    sha1 "7c46f7dd9b8b67eb3638c6702388e24c6e556ff6" => :mavericks
    sha1 "27149b9a067fbb8634af60e6a09b6e9e62bab681" => :mountain_lion
    sha1 "f9efbdf86bae448b7b3c1c42ccfb2a350d1d1bc3" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  test do
    system "#{bin}/mackup", '--help'
  end
end
