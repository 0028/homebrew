require 'formula'

class Ack < Formula
  homepage 'http://beyondgrep.com/'
  url 'http://beyondgrep.com/ack-2.12-single-file'
  sha1 '667b5f2dd83143848a5bfa47f7ba848cbe556e93'
  version '2.12'

  bottle do
    cellar :any
    sha1 "c078efc059e8a0a391f79f59842990d16b3be18b" => :mavericks
    sha1 "6977a2ace4a3d5f8d64e5713b0b621a89572439a" => :mountain_lion
    sha1 "6ed23ce20f99f12eaa714d5c665ddc7e6f64e16f" => :lion
  end

  def install
    bin.install "ack-2.12-single-file" => "ack"
    system "pod2man", "#{bin}/ack", "ack.1"
    man1.install "ack.1"
  end

  test do
    s = pipe("#{bin}/ack --noenv --nocolor bar -", "foo\nfoo bar\nbaz")
    assert_equal"foo bar\n", s
  end
end
