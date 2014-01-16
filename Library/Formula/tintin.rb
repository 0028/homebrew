require 'formula'

class Tintin < Formula
  homepage 'http://tintin.sf.net'
  url 'http://downloads.sourceforge.net/project/tintin/TinTin%2B%2B%20Source%20Code/2.01.0/tintin-2.01.0.tar.gz'
  sha256 'e0e35463a97ee5b33ef0b29b2c57fa8276c4e76328cb19c98a6ea92c603a9c76'

  bottle do
    cellar :any
    sha1 'ea06d89feaaf67237fa2c8ef2d141f45d452f4ed' => :mavericks
    sha1 '356e9ffe3e55ec4fa79c61564c731f1d4ac7c731' => :mountain_lion
    sha1 '0d205f11bb8e389bef6a1bf5c51fd4b0f26643f4' => :lion
  end

  depends_on 'pcre'

  def install
    # find Homebrew's libpcre
    ENV.append 'LDFLAGS', "-L#{HOMEBREW_PREFIX}/lib"

    cd 'src' do
      system "./configure", "--prefix=#{prefix}"
      system "make", "CFLAGS=#{ENV.cflags}",
                     "INCS=#{ENV.cppflags}",
                     "LDFLAGS=#{ENV.ldflags}",
                     "install"
    end
  end
end
