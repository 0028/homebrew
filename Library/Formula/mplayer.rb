require 'formula'

class Mplayer < Formula
  homepage 'http://www.mplayerhq.hu/'
  url 'http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.1.1.tar.xz'
  sha1 'ba2f3bd1442d04b17b0143680850273d928689c1'

  bottle do
    sha1 "4eac263d8fa0c137f6556581fc5c317ea1bc7b5f" => :mavericks
    sha1 "08f3f43c4fead52171cb85a96a95e9db3ac5db7f" => :mountain_lion
    sha1 "092960f4d162c143385d595099999dd3ca9255bb" => :lion
  end

  head 'svn://svn.mplayerhq.hu/mplayer/trunk', :using => StrictSubversionDownloadStrategy

  option 'with-x', 'Build with X11 support'
  option 'without-osd', 'Build without OSD'

  depends_on 'yasm' => :build
  depends_on 'libcaca' => :optional
  depends_on :x11 if build.with? 'x'

  unless build.without? 'osd' or build.with? 'x'
    # These are required for the OSD. We can get them from X11, or we can
    # build our own.
    depends_on :fontconfig
    depends_on :freetype
  end

  fails_with :clang do
    build 211
    cause 'Inline asm errors during compile on 32bit Snow Leopard.'
  end unless MacOS.prefer_64_bit?

  def patches
    p = []
    if build.head?
      # When building SVN, configure prompts the user to pull FFmpeg from git.
      # Don't do that.
      p << DATA
    else
      # Fix compilation on 10.9, adapted from upstream revision r36500
      p << "https://gist.github.com/jacknagel/7441175/raw/37657c264a6a3bb4d30dee14538c367f7ffccba9/vo_corevideo.h.patch"
      # Fix C99-style 'for (int i=0...)'
      p << "https://gist.githubusercontent.com/dscho/9210644/raw/16094d8d17b58689dec0e9f3a957fb2fd5744a9c/ao_coreaudio.c.patch"
    end
    p
  end

  def install
    # It turns out that ENV.O1 fixes link errors with llvm.
    ENV.O1 if ENV.compiler == :llvm

    # we disable cdparanoia because homebrew's version is hacked to work on OS X
    # and mplayer doesn't expect the hacks we apply. So it chokes.
    # Specify our compiler to stop ffmpeg from defaulting to gcc.
    # Disable openjpeg because it defines int main(), which hides mplayer's main().
    # This issue was reported upstream against openjpeg 1.5.0:
    # http://code.google.com/p/openjpeg/issues/detail?id=152
    args = %W[
      --prefix=#{prefix}
      --cc=#{ENV.cc}
      --host-cc=#{ENV.cc}
      --disable-cdparanoia
      --disable-libopenjpeg
    ]

    args << "--enable-menu" unless build.without? 'osd'
    args << "--disable-x11" unless build.with? 'x'
    args << "--enable-caca" if build.with? 'libcaca'

    system "./configure", *args
    system "make"
    system "make install"
  end

  test do
    system "#{bin}/mplayer", "-ao", "null", "/System/Library/Sounds/Glass.aiff"
  end
end

__END__
diff --git a/configure b/configure
index a1fba5f..5deaa80 100755
--- a/configure
+++ b/configure
@@ -49,8 +49,6 @@ if test -e ffmpeg/mp_auto_pull ; then
 fi
 
 if ! test -e ffmpeg ; then
-    echo "No FFmpeg checkout, press enter to download one with git or CTRL+C to abort"
-    read tmp
     if ! git clone --depth 1 git://source.ffmpeg.org/ffmpeg.git ffmpeg ; then
         rm -rf ffmpeg
         echo "Failed to get a FFmpeg checkout"
