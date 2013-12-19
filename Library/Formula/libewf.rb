require 'formula'

class Libewf < Formula
  homepage 'http://code.google.com/p/libewf/'
  url 'https://googledrive.com/host/0B3fBvzttpiiSMTdoaVExWWNsRjg/libewf-20131210.tar.gz'
  sha1 '0b133f39c1f69fe0044a41a502704336e2f54c78'

  bottle do
    cellar :any
    sha1 'a177d531371d9c4a2bd513609ee07d737cc3ceaf' => :mavericks
    sha1 '2885863ab9211cc277771f98de51dd4ac232ca3e' => :mountain_lion
    sha1 '7228f8b21665700938b8d7e13edf56f72eeb2671' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
    system "make install"
  end
end
