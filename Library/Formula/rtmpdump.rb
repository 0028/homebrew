require 'formula'

# Use a newer version instead of the upstream tarball:
# http://livestreamer.tanuki.se/en/latest/issues.html#installed-rtmpdump-does-not-support-jtv-argument
class Rtmpdump < Formula
  homepage 'http://rtmpdump.mplayerhq.hu'
  url 'http://ftp.de.debian.org/debian/pool/main/r/rtmpdump/rtmpdump_2.4+20121230.gitdf6c518.orig.tar.gz'
  version '2.4+20121230'
  sha1 'a58e8a9c9f99f721389215dd16162a698734f03b'

  head 'git://git.ffmpeg.org/rtmpdump'

  bottle do
    cellar :any
    sha1 "89235a3c293e67152cf0d00b9053c727d4008e3f" => :mavericks
    sha1 "e301afcfb91f66e11b602cd308598653c7eeeba0" => :mountain_lion
    sha1 "ec5c8e207c9b5e986e7266ca44f07e22579fac66" => :lion
  end

  depends_on 'openssl'

  fails_with :llvm do
    build '2336'
    cause "Crashes at runtime"
  end

  def install
    ENV.deparallelize
    system "make", "CC=#{ENV.cc}",
                   "XCFLAGS=#{ENV.cflags}",
                   "XLDFLAGS=#{ENV.ldflags}",
                   "MANDIR=#{man}",
                   "SYS=darwin",
                   "prefix=#{prefix}",
                   "sbindir=#{bin}",
                   "install"
  end
end
