require 'formula'

class Iptux < Formula
  homepage 'https://github.com/iptux-src/iptux'
  url 'https://github.com/iptux-src/iptux/archive/v0.6.1.tar.gz'
  sha1 '634c7e613bb83a18dfaaf6fc965202a390790921'

  bottle do
    sha1 '100c130fcbcf378d1c80953df8af447396e66880' => :mavericks
    sha1 '8525e8e321cb2b022294b31a2262ad9c6e17a05d' => :mountain_lion
    sha1 'b2dd9eddff389ce6a7929b83aa86b624c9d72642' => :lion
  end

  depends_on :x11
  depends_on 'gettext'
  depends_on 'gtk+'
  depends_on 'gconf'
  depends_on 'hicolor-icon-theme'
  depends_on 'pkg-config' => :build

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
