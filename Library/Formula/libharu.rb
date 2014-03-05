require 'formula'

class Libharu < Formula
  homepage 'http://www.libharu.org'
  url 'http://libharu.org/files/libharu-2.2.1.tar.bz2'
  sha1 'bfea7d9df3fb6a112340d0d54731f62f53b26d2f'

  bottle do
    cellar :any
    sha1 "6a258d688fcfb23e4073799d047e9e7333f9675b" => :mavericks
    sha1 "11aa0f24e5ee7663a660e55383b37ba2532e007d" => :mountain_lion
    sha1 "4f4e697af59a7d03994c20af9c05d21d04deb43c" => :lion
  end

  depends_on :libpng

  def patches
    # Fixes compilation against LibPNG 1.5. Can be removed on next release.
    # Based on a commit in the LibHaru repository which does not apply cleanly
    # due to a missing CHANGES file:
    #
    #     https://github.com/tony2001/libharu/commit/e5bf8b0.patch
    "http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/libharu/files/libharu-2.2.1-libpng-1.5.patch?revision=1.1"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--with-png=#{Formula["libpng"].opt_prefix}"
    system "make install"
  end
end
