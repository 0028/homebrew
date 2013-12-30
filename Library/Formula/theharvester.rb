require 'formula'

class Theharvester < Formula
  homepage 'https://code.google.com/p/theharvester/'
  url 'https://theharvester.googlecode.com/files/theHarvester-2.2a.tar.gz'
  sha1 'e02661ed6dd8d9d48d476ccee99878e15f67842a'

  bottle do
    cellar :any
    sha1 '1e019cb6d2a035070e4fce418d280eb24a292d44' => :mavericks
    sha1 '1fdae77100f79090bd9c52cc5815354f0745439d' => :mountain_lion
    sha1 '41b5c6a9a245a678c2c8f204cc29f65708f16c60' => :lion
  end

  depends_on :python

  def install
    libexec.install Dir['*']
    (libexec/'theHarvester.py').chmod 0755
    bin.install_symlink libexec/'theHarvester.py' => 'theharvester'
  end

  test do
    output = `#{bin}/theharvester -d brew.sh -l 1 -b google 2>&1`.strip
    assert_match(/misty@brew\.sh/, output)
  end
end
