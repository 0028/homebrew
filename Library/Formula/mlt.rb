require 'formula'

class Mlt < Formula
  homepage 'http://www.mltframework.org/'
  url 'http://downloads.sourceforge.net/mlt/mlt/mlt-0.9.0.tar.gz'
  sha1 '76bf18f4442801fae963c5a676d6626e383d1617'

  bottle do
    sha1 "9915c559bd8b6d2610ebecbffc0b8e821d5abfef" => :mavericks
    sha1 "69c75e496fc38bb23108aea857bb7443c7023866" => :mountain_lion
    sha1 "e32e03465db58ca66f76dec993d1c99a03100198" => :lion
  end

  depends_on 'pkg-config' => :build

  depends_on 'atk'
  depends_on 'ffmpeg'
  depends_on 'frei0r'
  depends_on 'libdv'
  depends_on 'libsamplerate'
  depends_on 'libvorbis'
  depends_on 'sdl'
  depends_on 'sox'

  depends_on 'gtk+' => :optional

  if build.with? 'gtk+'
    depends_on 'pango'
    depends_on 'gdk-pixbuf'
  end

  def install

    args = ["--prefix=#{prefix}",
            "--disable-jackrack",
            "--disable-swfdec"
           ]

    args << "--disable-gtk" if !build.with? 'gtk+'

    system "./configure", *args

    system "make"
    system "make", "install"
  end
end
