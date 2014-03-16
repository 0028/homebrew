require 'formula'

class Rkhunter < Formula
  homepage 'http://rkhunter.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/rkhunter/rkhunter/1.4.2/rkhunter-1.4.2.tar.gz'
  sha1 'da01bc6757e14549560ad6ea46d1e93dbf5ac90f'

  bottle do
    sha1 "710ec1a4ae4abe0c6c65612eeb305c0ce07a40a1" => :mavericks
    sha1 "6466aad79fcd9be7a64a750c5aeadc0f95191476" => :mountain_lion
    sha1 "699537efe059bb8878bb95fe75f62798479129ff" => :lion
  end

  def install
    system "./installer.sh", "--layout", "custom", prefix, "--install"
  end

  test do
    system "#{bin}/rkhunter", "--version"
  end
end
