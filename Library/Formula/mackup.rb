require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.5.5.tar.gz'
  sha1 '4b8433bf43515354caaf8b802a423b47a783ad8d'

  bottle do
    cellar :any
    sha1 '8316fa45bae7e52c55fce601276f21e9d461a5aa' => :mavericks
    sha1 'a28e0681f1a000e6d9ec1744b3908f9542ccc6d5' => :mountain_lion
    sha1 '800e7640a0acb1af6364c6b0bf7fe99e6602ba7b' => :lion
  end

  def install
    bin.install "mackup.py" => "mackup"
    (share/'mackup').install ".mackup.cfg" => "mackup.cfg.example"
  end
end
