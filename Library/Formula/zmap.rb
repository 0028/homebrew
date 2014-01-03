require 'formula'

class Zmap < Formula
  homepage 'https://zmap.io'
  url 'https://github.com/zmap/zmap/archive/v1.1.1.1.tar.gz'
  sha1 '0c53e6e6cfe35aefd7b018e41b80674fa25c3d49'
  head 'https://github.com/zmap/zmap.git'

  bottle do
    cellar :any
    sha1 'd99ca74eec140d8091760265d6fd5222237aea8e' => :mavericks
    sha1 '76f4d1b1d72629c36bb51b60def0e95ea3ef0978' => :mountain_lion
    sha1 '39a0f2cebae36c0ece59d3594e629eb18c27806e' => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'gengetopt' => :build
  depends_on 'byacc' => :build
  depends_on 'gmp'
  depends_on 'libdnet'
  depends_on 'json-c' => :optional
  depends_on 'hiredis' => :optional

  def install
    inreplace ['conf/zmap.conf','src/zmap.1','src/zmap.c','src/zopt.ggo'], '/etc', etc

    args = std_cmake_args
    args << '-DRESPECT_INSTALL_PREFIX_CONFIG=ON'
    args << '-DWITH_JSON=ON' if build.with? 'json-c'
    args << '-DWITH_REDIS=ON' if build.with? 'hiredis'

    system "cmake", ".", *args
    system "make", "install"
  end

  test do
    system "#{sbin}/zmap", "--version"
    assert_match /json/, `#{sbin}/zmap --list-output-modules` if build.with? 'json-c'
    assert_match /redis/, `#{sbin}/zmap --list-output-modules` if build.with? 'hiredis'
  end
end
