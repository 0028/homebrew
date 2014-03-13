require 'formula'

class Synfigstudio < Formula
  homepage 'http://synfig.org'
  url 'https://downloads.sourceforge.net/project/synfig/releases/0.64.1/source/synfigstudio-0.64.1.tar.gz'
  sha1 '0ba926d567fbfb79ba84899a2fcd79e54e33d4a4'

  bottle do
    sha1 "f1e466f801b2dd135daefce14b0063347734c740" => :mavericks
    sha1 "45b119c7db6f16b940a5386129b5e34a7e749847" => :mountain_lion
    sha1 "96064d698b488326837aa3c48894cd7f33d93e65" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on 'gettext'
  depends_on 'libsigc++'
  depends_on 'gtkmm'
  depends_on 'etl'
  depends_on 'synfig'

  def patches
    # Candidate upstream patch for Xcode 5
    # http://www.synfig.org/issues/thebuggenie/synfig/issues/504
    "http://www.synfig.org/issues/thebuggenie/files/show/80"
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
