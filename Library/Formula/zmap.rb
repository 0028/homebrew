require 'formula'

class Zmap < Formula
  homepage 'https://zmap.io'
  url 'https://github.com/zmap/zmap/archive/v1.2.0.tar.gz'
  sha1 'c3efb59c6433c790570aca5964f5d98f3464d330'

  head 'https://github.com/zmap/zmap.git'

  bottle do
    cellar :any
    sha1 "f761be1d71ac494430ce392e45fc0975879b82db" => :mavericks
    sha1 "5b70e170bd6167ed84d4e5a09bdc2aa3e376f0c4" => :mountain_lion
    sha1 "cc9c0f43e6cee653c28172b0c277ffe5aa87f5a1" => :lion
  end

  depends_on 'cmake' => :build
  depends_on 'gengetopt' => :build
  depends_on 'byacc' => :build
  depends_on 'gmp'
  depends_on 'libdnet'
  depends_on 'json-c' => :optional
  depends_on 'hiredis' => :optional

  def install
    inreplace ['conf/zmap.conf','src/zmap.c','src/zopt.ggo'], '/etc', etc

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
