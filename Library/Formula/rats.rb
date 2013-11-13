require 'formula'

class Rats < Formula
  homepage 'https://security.web.cern.ch/security/recommendations/en/codetools/rats.shtml'
  url 'https://rough-auditing-tool-for-security.googlecode.com/files/rats-2.3.tar.gz'
  sha1 '02283f2a5f0482f09c7e33d2aa84d68c48a8ec5a'

  bottle do
    sha1 '715362d68bbeeefd48b60ace0d031cae3b7e5642' => :mavericks
    sha1 'e8a636307af1872af8d6e74d9bf684fa4e732fab' => :mountain_lion
    sha1 'f3c4a607ffc5931a3d2cb85f20bb8f9ed6bad127' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--infodir=#{info}"
    system "make install"
  end

  test do
    system "#{bin}/rats"
  end
end
