require 'formula'

class SafeRm < Formula
  homepage 'http://www.safe-rm.org.nz/'
  url 'https://launchpad.net/safe-rm/trunk/0.10/+download/safe-rm-0.10.tar.gz'
  sha1 '6b829ae68e1fa3c8016e15ab37fcc08caef7712f'

  bottle do
    cellar :any
    sha1 '7b61fb4cd47ba88fdada653314d2d6b053f852e1' => :mavericks
    sha1 '9df21f25bbd414bc74b5dfeb6de8e74d4d0553bc' => :mountain_lion
    sha1 'f721bb06573bd5ec9318cb93e59bc76432116a03' => :lion
  end

  def install
    bin.install 'safe-rm'
  end

  test do
    file = "a-file"
    touch file
    system "#{bin}/safe-rm", file
    !File.exists? file
  end
end
