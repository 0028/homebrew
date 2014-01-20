require 'formula'

class Wdfs < Formula
  homepage 'http://noedler.de/projekte/wdfs/'
  url 'http://noedler.de/projekte/wdfs/wdfs-1.4.2.tar.gz'
  sha1 '71ae2e355d00bc1fbe7093b0a3b15ddc76a74516'

  bottle do
    cellar :any
    sha1 "aa3e6492b41a61b191527a880700f43e2f45165c" => :mavericks
    sha1 "be4266d56cfd9a1022f1c2f636f9dc8fc8603853" => :mountain_lion
    sha1 "24ee20632f54437f32a8c8e4c650919efda6bae7" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'glib'
  depends_on 'neon'
  depends_on 'osxfuse'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/wdfs", "-v"
  end
end
