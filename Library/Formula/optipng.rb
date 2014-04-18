require 'formula'

class Optipng < Formula
  homepage 'http://optipng.sourceforge.net/'
  head 'http://optipng.hg.sourceforge.net/hgweb/optipng/optipng'
  url 'https://downloads.sourceforge.net/project/optipng/OptiPNG/optipng-0.7.5/optipng-0.7.5.tar.gz'
  sha1 '30b6c333d74fc0f5dc83004aace252fa3321368b'

  bottle do
    cellar :any
    sha1 "b4c8d39ae8d09a341ae25b2d14af8e47b8f2d4b2" => :mavericks
    sha1 "e7a1875acf9a0747e1e11873506b8ffa4bd13405" => :mountain_lion
    sha1 "541b030c052c02a05c13128b34dabc571f546435" => :lion
  end

  def install
    system "./configure", "--with-system-zlib",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
