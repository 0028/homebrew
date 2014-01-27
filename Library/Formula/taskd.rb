require "formula"

class Taskd < Formula
  homepage "http://taskwarrior.org/projects/show/taskwarrior"
  url "http://www.taskwarrior.org/download/taskd-1.0.0.tar.gz"
  sha1 "5a89406a21be1f95ece03674315b35814fe4f037"
  head 'git://tasktools.org/taskd.git'

  bottle do
    sha1 "c4f2b583854be7b10baf9ee6d66f7dae0095d633" => :mavericks
    sha1 "00503ca87df4ad0f70255a1773dd309200d02659" => :mountain_lion
    sha1 "87b1ffc541bf0c5d5a47ea906c233c73e9461361" => :lion
  end

  depends_on "cmake" => :build
  depends_on "gnutls"

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/taskd", "init", '--data', testpath
  end
end
