require 'formula'

class Rats < Formula
  homepage 'https://security.web.cern.ch/security/recommendations/en/codetools/rats.shtml'
  url 'https://rough-auditing-tool-for-security.googlecode.com/files/rats-2.4.tgz'
  sha1 '1063210dbad5bd9f287b7b80bd7e412a63ae1792'

  bottle do
    sha1 'a0dd3b79d53278000ce8a10b36c418165ef81b85' => :mavericks
    sha1 '7e5cea55403cd289a3b9365586dc5e33757f5ba0' => :mountain_lion
    sha1 '6aac52f3ec401349747be3d0980dbf22ef9739dd' => :lion
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
