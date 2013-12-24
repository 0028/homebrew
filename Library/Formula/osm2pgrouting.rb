require 'formula'

class Osm2pgrouting < Formula
  homepage 'http://pgrouting.org/docs/tools/osm2pgrouting.html'
  url 'https://github.com/pgRouting/osm2pgrouting/archive/v2.0.0.tar.gz'
  sha1 '2d100ac9914919993a7c341e2395b8bafdfe3759'
  bottle do
    cellar :any
    sha1 'af5cbf32d0e7ee76d49fa03e4cfa8a3b0a3cfe33' => :mavericks
    sha1 'c515bc5c8570fff9b8bc4da6ced4a20eb4273639' => :mountain_lion
    sha1 '20f3e023ba5bdac6c62ef38c2152d6c743d37388' => :lion
  end

  head 'https://github.com/pgRouting/osm2pgrouting.git', :branch => 'master'

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on :postgresql

  def install
    # Fixes the default hard-coded /usr/share which the program would be installed in.
    # Instead we supply relative paths, and run cmake with flag -DCMAKE_INSTALL_PREFIX=#{prefix} so that
    # we get a proper path inside prefix.
    inreplace "CMakeLists.txt" do |s|
      s.gsub! "/usr/share/osm2pgrouting", "."
      s.gsub! "/usr/share/bin", "bin"
    end

    system "cmake", ".", *std_cmake_args
    system "make"
    system "make", "install"
  end

end
