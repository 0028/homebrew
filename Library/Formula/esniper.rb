require 'formula'

class Esniper < Formula
  homepage 'http://sourceforge.net/projects/esniper/'
  url 'https://downloads.sourceforge.net/project/esniper/esniper/2.29.0/esniper-2-29-0.tgz'
  version '2.29'
  sha1 'e08bf08c05f99768f3b8ca52065ad5573eb40770'

  bottle do
    cellar :any
    sha1 "f7be324d36a06ada7f2eb3fcfc7336c563666bd2" => :mavericks
    sha1 "0fa572bbc4ee7b916f9a008b79b1d62c1b05cdb7" => :mountain_lion
    sha1 "5faa13f68ca9d7fb6fdc3af24b411779e5089e8d" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
