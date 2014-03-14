require "formula"

class UserspaceRcu < Formula
  homepage "http://lttng.org/urcu"
  url "http://lttng.org/files/urcu/userspace-rcu-0.8.4.tar.bz2"
  sha1 "4b3bf1b76e6ea50d9a56d9e5e00df2cc7c4d610f"

  bottle do
    cellar :any
    sha1 "fb74deea876478429b21c85da9801d6e73ac27a0" => :mavericks
    sha1 "7a8ff2614b56e54a314758f1dc5e0c16f3f3283a" => :mountain_lion
    sha1 "91d97397f1c5cc9a639fbb423104281c87bc78f6" => :lion
  end

  def install
    args = ["--disable-dependency-tracking", "--disable-silent-rules",
            "--disable-rpath", "--prefix=#{prefix}"]
    # workaround broken upstream detection of build platform
    if MacOS.prefer_64_bit?
      args << "--build=#{Hardware::CPU.arch_64_bit}"
    end

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    system "cp", "-a", "#{share}/doc/userspace-rcu/examples", "."
    system "make", "-C", "examples"
  end
end
