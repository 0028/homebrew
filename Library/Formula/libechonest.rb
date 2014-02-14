require 'formula'

class Libechonest < Formula
  homepage 'https://projects.kde.org/projects/playground/libs/libechonest'
  url 'http://files.lfranchi.com/libechonest-2.2.0.tar.bz2'
  sha1 'fec281d9288c2a4fabd2dd275f1a508dd6d1bc5c'

  bottle do
    sha1 "02a85fe8597a33bafeaf9fd89bce9ff278ae8105" => :mavericks
    sha1 "7839ddb9f2f21c10c1d1ed6e5f9647a9a38fc186" => :mountain_lion
    sha1 "53b4766808fffbeb28af1bebf62c28a299da99ef" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'qt'
  depends_on 'qjson'

  conflicts_with 'doxygen', :because => "cmake fails to configure build."

  def install
    system "cmake", ".", *std_cmake_args
    system "make install"
  end
end
