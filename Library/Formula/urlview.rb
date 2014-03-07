require 'formula'

class Urlview < Formula
  homepage 'http://packages.debian.org/unstable/misc/urlview'
  url 'http://mirrors.kernel.org/debian/pool/main/u/urlview/urlview_0.9.orig.tar.gz'
  bottle do
    cellar :any
    sha1 "0460997184b36750da4bfd93275e2fe8e189092d" => :mavericks
    sha1 "d8bfa5d4ebe26ada1c4ef6e9ca3f137807c16967" => :mountain_lion
    sha1 "76ab148ec647c58443a1506e83a0554dd48256e2" => :lion
  end

  mirror 'http://ftp.us.debian.org/debian/pool/main/u/urlview/urlview_0.9.orig.tar.gz'
  sha1 '323af9ba30ba87ec600531629f5dd84c720984b6'

  def patches
    "http://mirrors.kernel.org/debian/pool/main/u/urlview/urlview_0.9-19.diff.gz"
  end

  def install
    inreplace 'urlview.man', '/etc/urlview/url_handler.sh', 'open'
    inreplace 'urlview.c',
      '#define DEFAULT_COMMAND "/etc/urlview/url_handler.sh %s"',
      '#define DEFAULT_COMMAND "open %s"'

    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    man1.mkpath
    system "make install"
  end
end
