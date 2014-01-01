require 'formula'

class SafeRm < Formula
  homepage 'https://launchpad.net/safe-rm'
  url 'https://launchpad.net/safe-rm/trunk/0.10/+download/safe-rm-0.10.tar.gz'
  sha1 '6b829ae68e1fa3c8016e15ab37fcc08caef7712f'

  bottle do
    cellar :any
    sha1 '5af8ac2c53e4264cd2849b1a8597942ee65dfd60' => :mavericks
    sha1 'e62b96b00ff3f22259c4151e7d4d6ea5ddfb0a92' => :mountain_lion
    sha1 '205134f7c2e4d160f3b5260f39f0ac0758979ea4' => :lion
  end

  def install
    bin.install 'safe-rm'
  end

  test do
    file = "a-file"
    touch file
    system "#{bin}/safe-rm", file
    assert !File.exist?(file)
  end
end
