require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.7.tar.gz'
  sha1 '6876f5b08c80f1ff11570e5a1db073a2c080dcf2'

  head 'https://github.com/lra/mackup.git'

  bottle do
    sha1 "294f47df6cf8a80aa528f3ed0297c83cec2eb2f2" => :mavericks
    sha1 "e647a168103622d12d0074241774cf12ea797e3a" => :mountain_lion
    sha1 "fcbd60c831912d98520de3d71e4eb76d1527df0d" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  def test
    system "#{bin}/mackup", '--help'
  end
end
