require 'formula'

class Xrootd < Formula
  homepage 'http://xrootd.org'
  url 'http://xrootd.org/download/v3.3.6/xrootd-3.3.6.tar.gz'
  sha1 'be1fca000a517933c73c68e40cee6203fd2b6ad6'

  bottle do
    cellar :any
    sha1 "4d7f398fea8e8e6738a7d45c4df438fe0a6ffa2d" => :mavericks
    sha1 "f313aacf825306db68beda32b27297dfb9b589fe" => :mountain_lion
    sha1 "1141dae9f458620f4b813bed08cefa189d58bb49" => :lion
  end

  depends_on 'cmake' => :build

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make install"
    end
    share.install prefix/'man'
  end

  def test
    system "#{bin}/xrootd", "-H"
  end
end
