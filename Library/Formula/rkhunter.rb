require 'formula'

class Rkhunter < Formula
  homepage 'http://rkhunter.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/rkhunter/rkhunter/1.4.0/rkhunter-1.4.0.tar.gz'
  sha1 '48798beec504c00af93bf64b6e35dfc7d7aaff07'

  bottle do
    sha1 'a1c8e7c716696471baf197a7f0c45406d2b00f87' => :mavericks
    sha1 'd3ed7fcccca13f9d7c4215c3fef92655793d503b' => :mountain_lion
    sha1 '18d1b91d0065f09175f7ff48ee56c4589c72fa56' => :lion
  end

  def install
    system "./installer.sh --layout custom #{prefix} --install"
  end

  test do
    system "#{bin}/rkhunter", "--version"
  end
end
