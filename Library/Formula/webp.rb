require 'formula'

class Webp < Formula
  homepage 'http://code.google.com/speed/webp/'
  url 'https://webp.googlecode.com/files/libwebp-0.3.1.tar.gz'
  sha1 '52e3d2b6c0b80319baa33b8ebed89618769d9dd8'

  bottle do
    cellar :any
    sha1 '8efbe6da417e05641a77eec1301f1eaa5d8771ca' => :mavericks
    sha1 '00ce5eb8133fbf636857d165f52f052bda1bc09a' => :mountain_lion
    sha1 'affdaf6d516f7c413735ae906a169f5754a77cc8' => :lion
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
