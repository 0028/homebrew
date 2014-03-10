require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.7.1.tar.gz'
  sha1 'e09606708d9a61dfa5e574b789f4f858ad7fe2e2'

  head 'https://github.com/lra/mackup.git'

  bottle do
    sha1 "df8f1598ea5713a5c760e45ac152db79cc3dfe00" => :mavericks
    sha1 "bfea937f346abe8a5b20c363f0fae9e6e2a455ce" => :mountain_lion
    sha1 "0d35a1b8a6566c9fd7504fd927f2ce9325955e02" => :lion
  end

  depends_on :python

  def install
    system 'python', 'setup.py', 'install', "--prefix=#{prefix}"
  end

  test do
    system "#{bin}/mackup", '--help'
  end
end
