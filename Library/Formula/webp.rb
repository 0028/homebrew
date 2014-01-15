require 'formula'

class Webp < Formula
  homepage 'http://code.google.com/speed/webp/'
  url 'https://webp.googlecode.com/files/libwebp-0.4.0.tar.gz'
  sha1 '326c4b6787a01e5e32a9b30bae76442d18d2d1b6'

  bottle do
    cellar :any
    sha1 '76e7848092b6a38312a4fd88a4fe97535d47ee1c' => :mavericks
    sha1 '500fe61da52cf10b0c58dc3677ca6971b4cc0f53' => :mountain_lion
    sha1 'ab1e4abb5a1dbf522778e363abb4a385fcbeaaa2' => :lion
  end

  option :universal

  depends_on :libpng
  depends_on 'jpeg' => :recommended

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--enable-libwebpmux",
                          "--enable-libwebpdemux",
                          "--enable-libwebpdecoder",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    system "#{bin}/cwebp", \
      "/usr/share/doc/cups/images/cups.png", "-o", "webp_test.png"
    system "#{bin}/dwebp", "webp_test.png", "-o", "webp_test.webp"
  end
end
