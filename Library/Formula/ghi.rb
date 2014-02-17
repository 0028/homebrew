require 'formula'

class Ghi < Formula
  homepage 'https://github.com/stephencelis/ghi'
  url 'https://github.com/stephencelis/ghi/archive/0.9.2.tar.gz'
  sha1 'c62c8d0e8e510db82ca3880a13c4f965c728cfb5'

  bottle do
    cellar :any
    sha1 "3a99f92331b658e7ad025db35c4ebb28f0d12f16" => :mavericks
    sha1 "8ae3be162b6ff6f4d68ecee1dab76fd97e2bb805" => :mountain_lion
    sha1 "58bbee22aba9e7b5270c742f44460a52e7fca885" => :lion
  end

  def install
    bin.install "ghi"
    man1.install "man/ghi.1"
  end

  test do
    system "#{bin}/ghi", "--version"
  end
end
