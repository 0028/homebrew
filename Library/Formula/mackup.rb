require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.6.1.tar.gz'
  sha1 '35cdbb7437b345c04ef87d04bd4e8c27c24236de'

  head 'https://github.com/lra/mackup.git'

  bottle do
    sha1 "dfac24b26716bce91a74fceba1842086a2c4f4c3" => :mavericks
    sha1 "5ff033380b74de5c098985b54be877cafa07fea0" => :mountain_lion
    sha1 "943325894a8fd7e98029fa6352240a4a663b5a1d" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  def test
    system "#{bin}/mackup", '--help'
  end
end
