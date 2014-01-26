require 'formula'

class Taskd < Formula
  homepage 'http://taskwarrior.org'
  url 'http://taskwarrior.org/download/taskd-1.0.0.tar.gz'
  sha1 '5a89406a21be1f95ece03674315b35814fe4f037'
  head 'http://tasktools.org/taskd.git'

  bottle do
    sha1 "2b300cca9e268911a36e769a7cf8f941b788f09c" => :mavericks
    sha1 "8bf66d99dde208398c62343e688161775379101d" => :mountain_lion
    sha1 "36a8305d044672488f54659b2a8dd939d60b0cb2" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'gnutls'
  depends_on 'ossp-uuid'
  depends_on 'readline'

  def install
    system "cmake", ".", *std_cmake_args
    system "make", "install"
  end

  test do
    system "#{bin}/taskd", 'diagnostics'
  end
end

