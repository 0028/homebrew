require 'formula'

class Portaudio < Formula
  homepage 'http://www.portaudio.com'
  url 'http://www.portaudio.com/archives/pa_stable_v19_20111121.tgz'
  sha1 'f07716c470603729a55b70f5af68f4a6807097eb'

  bottle do
    cellar :any
    sha1 "ac496b4a9900382d74603a7467c6cb1b2dd51149" => :mavericks
    sha1 "c156002f0326a6d88ed0d8d2a5ac2fcf3e9fb71d" => :mountain_lion
    sha1 "58a2327d1bfafaced97883ed35c2ebb65a3deea3" => :lion
  end

  head 'https://subversion.assembla.com/svn/portaudio/portaudio/trunk/', :using => :svn

  depends_on 'pkg-config' => :build

  option :universal

  fails_with :llvm do
    build 2334
  end

  # Fix PyAudio compilation on Lion
  def patches
    if MacOS.version >= :lion and not build.head?
      { :p0 => "https://raw.github.com/sakuro/macports/9ee0b7dd6045a3967348638a228bc1a658bcaa3f/audio/portaudio/files/patch-include__pa_mac_core.h.diff" }
    end
  end

  def install
    ENV.universal_binary if build.universal?

    args = [ "--prefix=#{prefix}",
             "--disable-debug",
             "--disable-dependency-tracking",
             # portaudio builds universal unless told not to
             "--enable-mac-universal=#{build.universal? ? 'yes' : 'no'}" ]

    system "./configure", *args
    system "make install"

    # Need 'pa_mac_core.h' to compile PyAudio
    include.install "include/pa_mac_core.h"
  end
end
