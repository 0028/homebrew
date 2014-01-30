require 'formula'

class Ack < Formula
  homepage 'http://beyondgrep.com/'
  url 'http://beyondgrep.com/ack-2.12-single-file'
  sha1 '667b5f2dd83143848a5bfa47f7ba848cbe556e93'
  version '2.12'

  bottle do
    cellar :any
    sha1 "5423dcc6264572015939eba6315ee9629f4cf512" => :mavericks
    sha1 "fd1450eed7364e0882b4529fe8f14ce0adc13d60" => :mountain_lion
    sha1 "008a4f566943dfb44f70593d9cd704e15d015167" => :lion
  end

  def install
    bin.install "ack-2.12-single-file" => "ack"
    system "pod2man", "#{bin}/ack", "ack.1"
    man1.install "ack.1"
  end

  test do
    system "#{bin}/ack", '--version'
  end
end
