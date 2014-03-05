require 'formula'

class Mlt < Formula
  homepage 'http://www.mltframework.org/'
  url 'https://downloads.sourceforge.net/mlt/mlt/mlt-0.9.0.tar.gz'
  sha1 '76bf18f4442801fae963c5a676d6626e383d1617'

  bottle do
    sha1 "22b1d5209ba4548c64d6ef2ad6f982f961a093d9" => :mavericks
    sha1 "097854e7644e62c99487bc8c16b06b0a2d979855" => :mountain_lion
    sha1 "569728be1bc542fba31db989cf2ac04bf619f8f1" => :lion
  end

  depends_on "pkg-config" => :build

  depends_on "atk"
  depends_on "ffmpeg"
  depends_on "frei0r"
  depends_on "libdv"
  depends_on "libsamplerate"
  depends_on "libvorbis"
  depends_on "sdl"
  depends_on "sox"

  depends_on "gtk+" => :optional

  if build.with? "gtk"
    depends_on "pango"
    depends_on "gdk-pixbuf"
  end

  def install

    args = ["--prefix=#{prefix}",
            "--disable-jackrack",
            "--disable-swfdec"
           ]

    args << "--disable-gtk" unless build.with? "gtk"

    system "./configure", *args

    system "make"
    system "make", "install"
  end
end
