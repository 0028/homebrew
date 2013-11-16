require 'formula'

class CmuSphinxbase < Formula
  homepage 'http://cmusphinx.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/cmusphinx/sphinxbase/0.8/sphinxbase-0.8.tar.gz'
  sha1 'c0c4d52e143d07cd593bd6bcaeb92b9a8a5a8c8e'

  bottle do
    cellar :any
    sha1 '6c6af3d56ad67453d22e5dc08f04c54018b48727' => :mavericks
    sha1 '91f56102e1279daa1375bbc562adb2555941e8d6' => :mountain_lion
    sha1 'b09c3e2e691e1674a984eaef490c46e41be437f5' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on :python
  depends_on 'libsndfile' => :optional
  depends_on 'libsamplerate' => :optional

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def caveats
    python.standard_caveats if python
  end
end
