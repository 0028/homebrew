require 'formula'

class Ack < Formula
  homepage 'http://beyondgrep.com/'
  url 'http://beyondgrep.com/ack-2.12-single-file'
  sha1 '667b5f2dd83143848a5bfa47f7ba848cbe556e93'
  version '2.12'

  bottle do
    cellar :any
    sha1 "ea3a8b0356156fe6d1f9c789b9f3955a964309d7" => :mavericks
    sha1 "acf6603f4b84d1db0522a00774fea39a070e075e" => :mountain_lion
    sha1 "2a2029b7cc6c281e99c1eea217af178d2a8ee6f4" => :lion
  end

  def install
    bin.install "ack-2.12-single-file" => "ack"
    system "pod2man", "#{bin}/ack", "ack.1"
    man1.install "ack.1"
  end

  test do
    IO.popen("#{bin}/ack --noenv --nocolor bar -", "w+") do |pipe|
      pipe.write "foo\nfoo bar\nbaz"
      pipe.close_write
      assert_equal "foo bar\n", pipe.read
    end
  end
end
