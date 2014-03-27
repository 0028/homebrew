require 'formula'

class Gifsicle < Formula
  homepage 'http://www.lcdf.org/gifsicle/'
  url 'http://www.lcdf.org/gifsicle/gifsicle-1.81.tar.gz'
  sha1 'c2952fb3cb601dcfcdf5bd5b9522b6c23731f063'

  bottle do
    cellar :any
    sha1 "1a933a2daba0df0cb4a580b7cc8e9f97ccb22d64" => :mavericks
    sha1 "09bd220eb3c04a274d4440f6779620486e5b4942" => :mountain_lion
    sha1 "40783904775ba4bd4527aa75f5b04d3025839b14" => :lion
  end

  depends_on :x11 => :optional

  def install
    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    args << '--disable-gifview' if build.without? 'x11'

    system './configure', *args
    system 'make install'
  end
end
