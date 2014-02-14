require 'formula'

class Task < Formula
  homepage 'http://www.taskwarrior.org/'
  url 'http://www.taskwarrior.org/download/task-2.3.0.tar.gz'
  sha1 'b5390a1c1232bcb727f5a595ac1141184810d09d'
  bottle do
    sha1 "8577e5133cc51d91ffac7f69bf5a2a61f4dd7160" => :mavericks
    sha1 "437710f50eed41c184ca9b7e813237f0dca35294" => :mountain_lion
    sha1 "9067e93e71fe942f9278baba1c833097b5e16781" => :lion
  end

  head 'git://tasktools.org/task.git', :branch => '2.4.0', :shallow => false

  depends_on "cmake" => :build
  depends_on "gnutls" => :optional

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
    bash_completion.install 'scripts/bash/task.sh'
    zsh_completion.install 'scripts/zsh/_task'
  end

  test do
    system "#{bin}/task", "--version"
  end
end
