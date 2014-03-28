require "formula"

class Gifsicle < Formula
  homepage "http://www.lcdf.org/gifsicle/"
  url "http://www.lcdf.org/gifsicle/gifsicle-1.82.tar.gz"
  sha1 "2771af4ab39064df04a538bcb6f777d2ba3d628b"

  bottle do
    cellar :any
    sha1 "23e5db1dbc18cc43bdb987643abfe752af34f9ef" => :mavericks
    sha1 "704adc6ba43bb0ffcd2fc32d781b22ad387d4a4c" => :mountain_lion
    sha1 "f3e84f5f4741c6c493d41ffd438ee109e8e551d7" => :lion
  end

  depends_on :x11 => :optional

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << "--disable-gifview" if build.without? "x11"

    system "./configure", *args
    system "make install"
  end
end
