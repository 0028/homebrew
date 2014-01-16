require 'formula'

class Ktoblzcheck < Formula
  homepage 'http://ktoblzcheck.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/ktoblzcheck/ktoblzcheck-1.44.tar.gz'
  sha1 'ccb02a59ae216ca65b9de4a545f83c56e0290d5e'

  bottle do
    sha1 '5bebeb458031855fd8a75dae1d651ef30a6e2d78' => :mavericks
    sha1 '0bb8cb29aa0fdf4a2de5a6fb77ec66699b70c5b8' => :mountain_lion
    sha1 'a613000898b5bcc141a5389662ed8372ce385c48' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    ENV.j1
    system "make install"
  end
end
