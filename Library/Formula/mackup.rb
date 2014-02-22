require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.7.tar.gz'
  sha1 '5d8ce05647773bee67e0e1f5c714be6193db16a7'

  head 'https://github.com/lra/mackup.git'

  bottle do
    sha1 "af32112532d9d85835e7cee0c691df8cdc3e698c" => :mavericks
    sha1 "aa2c336cf34735db74c774dbbae49ec0894be923" => :mountain_lion
    sha1 "ecdd5c6271a8cad7e5fdc993f5c5b92b99859756" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  def test
    system "#{bin}/mackup", '--help'
  end
end
