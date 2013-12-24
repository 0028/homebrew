require 'formula'

class Qd < Formula
  homepage 'http://crd.lbl.gov/~dhbailey/mpdist/'
  url 'http://crd.lbl.gov/~dhbailey/mpdist/qd-2.3.14.tar.gz'
  sha1 'bda1048feed8c3a52957e5e63592163aa0a15da4'

  bottle do
    cellar :any
    sha1 '43849e9945b8c31f71a4a0123a7dcb617ff7909b' => :mavericks
    sha1 '4dec5f39552dc4e80aec9966d2277a30ce4de66c' => :mountain_lion
    sha1 'c53fa546307a1d530ff0883980b4542bcf82c01f' => :lion
  end

  depends_on :fortran => :recommended

  def install
    args = ["--disable-dependency-tracking", "--enable-shared", "--prefix=#{prefix}"]
    args << "--enable-fortran=no" unless build.with? :fortran
    system "./configure", *args
    system "make"
    system "make check"
    system "make install"
  end
end
