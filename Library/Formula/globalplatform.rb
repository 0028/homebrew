require "formula"

class Globalplatform < Formula
  homepage "http://sourceforge.net/p/globalplatform/wiki/Home/"
  url "https://downloads.sourceforge.net/project/globalplatform/GlobalPlatform%20Library/GlobalPlatform%20Library%206.0.0/globalplatform-6.0.0.tar.gz"
  sha1 "5a08bec4cbcc8caffa7c646a35600712f468553c"

  bottle do
    cellar :any
    sha1 "37dbcd6a19edaf366ddd9bc63e6525afa3879212" => :mavericks
    sha1 "6b5c19ebc22156608fc032d72ba06f70a7e61f5b" => :mountain_lion
    sha1 "2a1d02c9b3ce93354187d07e6e74219f8a83fd15" => :lion
  end

  # Disabled, apparently HEAD uses cmake, and thus needs an entirely new formula, I guess. - ELLIOTTCABLE
  # head 'svn://svn.code.sf.net/p/globalplatform/code/trunk/globalplatform'

  def install
    ENV.append 'PCSCLITE_CFLAGS', "-I#{MacOS.sdk_path}/System/Library/Frameworks/PCSC.framework/Versions/A/Headers/"

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
