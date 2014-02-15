require 'formula'

class Ghi < Formula
  homepage 'https://github.com/stephencelis/ghi'
  url 'https://github.com/stephencelis/ghi/archive/0.9.1.tar.gz'
  sha1 '5aa347d092d80ad6097b811abc486f9da8dfee46'

  bottle do
    cellar :any
    sha1 "d4f02eff3d14462138dea56c3763c1e48fa3698d" => :mavericks
    sha1 "9e0bff186553c420d6a9724f48ca5cf65a2345ce" => :mountain_lion
    sha1 "3e72cc410efc92cfcfe01b5050f161b5be30830b" => :lion
  end

  def install
    bin.install "ghi"
    man1.install "man/ghi.1"
  end

  test do
    system "#{bin}/ghi", "--version"
  end
end
