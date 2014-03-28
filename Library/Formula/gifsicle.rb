require "formula"

class Gifsicle < Formula
  homepage "http://www.lcdf.org/gifsicle/"
  url "http://www.lcdf.org/gifsicle/gifsicle-1.82.tar.gz"
  sha1 "2771af4ab39064df04a538bcb6f777d2ba3d628b"

  bottle do
    cellar :any
    sha1 "d5dfbeb1e7174516c9066655188c0e70de898574" => :mavericks
    sha1 "da81b9bcce0a33b7353796ab91fd5adcbb4b6f32" => :mountain_lion
    sha1 "e69894af9b65a9f210e90b7eaa2f935f0f30ec53" => :lion
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
