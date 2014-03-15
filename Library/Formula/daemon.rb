require 'formula'

class Daemon < Formula
  homepage 'http://libslack.org/daemon/'
  url 'http://libslack.org/daemon/download/daemon-0.6.4.tar.gz'
  sha1 'fa6298f05f868d54660a7ed70c05fb7a0963a24b'

  bottle do
    cellar :any
    sha1 "daba24f1ac885ceaf3e491ff90f9959887d4528d" => :mavericks
    sha1 "308c6df7776b2d1d99a0eca4869b983575f18b37" => :mountain_lion
    sha1 "65073e4711f6b18d6b0790c070555a52ef19e0e6" => :lion
  end

  def patches
    # fixes for mavericks strlcpy/strlcat: https://trac.macports.org/ticket/42845
    {:p1 => "https://trac.macports.org/raw-attachment/ticket/42845/daemon-0.6.4-ignore-strlcpy-strlcat.patch"} if MacOS.version == :mavericks
  end

  def install
    system "./config"
    system "make"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    system "#{bin}/daemon", "--version"
  end
end
