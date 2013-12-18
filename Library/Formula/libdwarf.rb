require 'formula'

class Libdwarf < Formula
  homepage 'http://www.prevanders.net/dwarf.html'
  url 'http://www.prevanders.net/libdwarf-20130729.tar.gz'
  sha1 '68e3cef6a8b1d0ad56f0a45128f64bb37b0b6340'

  bottle do
    cellar :any
    sha1 '3e3aab8b11e34397f74539a87f6028e49bc2bff4' => :mavericks
    sha1 '267357c0e2b34f7e73d1fe51eefaea5e77ee000c' => :mountain_lion
    sha1 '4a91ac1bd381854f1435c5a6cbddaadbd8e3db6c' => :lion
  end

  keg_only 'Used as a dependency for other formulas'

  depends_on 'libelf'

  def install
    chdir 'libdwarf' do
      system "./configure", "--disable-debug",
                            "--disable-dependency-tracking",
                            "--prefix=#{prefix}"
      system "make"
      lib.install 'libdwarf.a'
      include.install 'dwarf.h', 'libdwarf.h'
      doc.install 'README', 'NEWS', 'COPYING', 'ChangeLog'
      doc.install Dir['*.pdf']
    end
  end
end
