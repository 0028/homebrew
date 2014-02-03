require 'formula'

class Leptonica < Formula
  homepage 'http://www.leptonica.org/'
  url 'http://www.leptonica.com/source/leptonica-1.70.tar.gz'
  sha1 '2c7a893c48aec7844d6b2c7123a0ede7a0d8300e'

  bottle do
    cellar :any
    sha1 "91e781c14c53d1f3dec15755242482cc13b81b03" => :mavericks
    sha1 "4a8007b1a63057fce87123679d575cce679ba7bc" => :mountain_lion
    sha1 "902877f85361f13975690a158a65bfa5be507cea" => :lion
  end

  option 'check', 'Run the build checks'

  depends_on :libpng => :recommended
  depends_on 'jpeg' => :recommended
  depends_on 'libtiff' => :optional

  conflicts_with 'osxutils',
    :because => "both leptonica and osxutils ship a `fileinfo` executable."

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make check" if build.include? 'check'
    system "make install"
  end
end
