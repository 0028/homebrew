require 'formula'

class Libass < Formula
  homepage 'http://code.google.com/p/libass/'
  url 'https://github.com/libass/libass/releases/download/0.11.1/libass-0.11.1.tar.gz'
  sha1 '2a5517e634b3606c7dad5a42eae6ad8b23f8e097'

  bottle do
    cellar :any
    sha1 "d9aa3eec1426591cc451f4602ec0dd559c3c6502" => :mavericks
    sha1 "17240a3d483765d7b9d498e0214be840c77986ef" => :mountain_lion
    sha1 "943f3a412f050d0055f91ded1211b4e4cf297b9c" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'yasm' => :build

  depends_on :freetype
  depends_on 'fribidi'
  depends_on :fontconfig

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
