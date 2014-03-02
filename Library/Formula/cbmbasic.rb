require 'formula'

class Cbmbasic < Formula
  homepage 'http://cbmbasic.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/cbmbasic/cbmbasic/1.0/cbmbasic-1.0.tgz'
  sha1 '54564daa7f28be98b03ae7dd1eece9e5439c95c3'

  bottle do
    cellar :any
    sha1 "8b1bfce5b8efbb40c5078338700a642bef6a09e1" => :mavericks
    sha1 "7a0842b6caf9fdfc7cb63913d69a942c23154238" => :mountain_lion
    sha1 "8c583e8931b3ebc72500a1435eaeb2abc03e085c" => :lion
  end

  def install
    system "make", "CFLAGS=#{ENV.cflags}", "LDFLAGS=#{ENV.ldflags}"
    bin.install 'cbmbasic'
  end

  test do
    assert_match /READY.\r\n 1/, pipe("#{bin}/cbmbasic", "PRINT 1\n")
  end
end
