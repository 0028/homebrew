require "formula"

class Hashpump < Formula
  homepage "https://github.com/bwall/HashPump"
  url "https://github.com/bwall/HashPump/archive/v1.0.0.tar.gz"
  sha1 "217fed29f90f224db3a2e8b8309523d56f477a41"

  bottle do
    cellar :any
    sha1 "38e6e21bd214aaeeb0d160c4f5460a8f0dc37cd0" => :mavericks
    sha1 "a5b9f42f7a44052a7457ac20c392fdad359f9842" => :mountain_lion
    sha1 "2e98d65419a962f8cf5e84359ec86b1f26e49b96" => :lion
  end

  def install
    bin.mkpath
    system "make", "install", "INSTALLLOCATION=#{bin}"
  end

  test do
    system "#{bin}/hashpump",
           "-s", "6d5f807e23db210bc254a28be2d6759a0f5f5d99",
           "-d", "count=10&lat=37.351&user_id=1&long=-119.827&waffle=eggo",
           "-a", "&waffle=liege",
           "-k", "14"
  end
end
