require 'formula'

class Ack < Formula
  homepage 'http://beyondgrep.com/'
  url 'http://beyondgrep.com/ack-2.12-single-file'
  sha1 '667b5f2dd83143848a5bfa47f7ba848cbe556e93'
  version '2.12'

  bottle do
    cellar :any
    sha1 'bdb338c1b74b2b89a38b52f281cb927fc278b972' => :mavericks
    sha1 '8ce2a56fdb9b40c1613d756acd58edf7da7b9228' => :mountain_lion
    sha1 '1c9d089740c593cdb6a5b220cf3a270e2e50aa05' => :lion
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
