require 'formula'

class Cgal < Formula
  homepage 'http://www.cgal.org/'
  url 'https://gforge.inria.fr/frs/download.php/32994/CGAL-4.3.tar.gz'
  sha1 '035d5fd7657e9eeccfc46ff0ebf84f137e63b03a'

  bottle do
    sha1 'd02032c3d039340074f5eb0120a794ab03363e12' => :mavericks
    sha1 'a5c2dfbf85964f0bd5b35a42b3c9cb5d0fa0bc6a' => :mountain_lion
    sha1 '60c5efd8f3e9c02c416ff9b6e4f9a848096b5713' => :lion
  end

  option :cxx11

  option 'imaging', "Build ImageIO and QT compoments of CGAL"
  option 'with-eigen3', "Build with Eigen3 support"
  option 'with-lapack', "Build with LAPACK support"

  depends_on 'cmake' => :build
  depends_on 'boost' => build.cxx11? ? ['c++11'] : []
  depends_on 'gmp'   => build.cxx11? ? ['c++11'] : []
  depends_on 'mpfr'

  depends_on 'qt' if build.include? 'imaging'
  depends_on 'eigen' if build.include? 'with-eigen3'

  def install
    ENV.cxx11 if build.cxx11?
    args = ["-DCMAKE_INSTALL_PREFIX=#{prefix}",
            "-DCMAKE_BUILD_TYPE=Release",
            "-DCMAKE_BUILD_WITH_INSTALL_RPATH=ON",
            "-DCMAKE_INSTALL_NAME_DIR=#{HOMEBREW_PREFIX}/lib"]
    unless build.include? 'imaging'
      args << "-DWITH_CGAL_Qt3=OFF" << "-DWITH_CGAL_Qt4=OFF" << "-DWITH_CGAL_ImageIO=OFF"
    end
    if build.include? 'with-eigen3'
      args << "-DWITH_Eigen3=ON"
    end
    if build.include? 'with-lapack'
      args << "-DWITH_LAPACK=ON"
    end
    args << '.'
    system "cmake", *args
    system "make install"
  end
end
