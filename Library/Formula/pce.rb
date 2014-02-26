require 'formula'

class Pce < Formula
  homepage 'http://www.hampa.ch/pce/'
  url 'http://www.hampa.ch/pub/pce/pce-0.2.2.tar.gz'
  sha1 'b12dffbacaad44532b5c576bcffae5d11f17cc56'

  head 'git://git.hampa.ch/pce.git'

  bottle do
    sha1 "c89b06761c051588f1391ac4ac889c7a0c7dcb64" => :mavericks
    sha1 "8f2b647133368c2fbbee7a5d3f23ece67308afaf" => :mountain_lion
    sha1 "d1d203eebef7c8bdf7598eff59a646ef2b065a9d" => :lion
  end

  devel do
    url 'http://www.hampa.ch/pub/pce/pre/pce-20140222-4b05f0c.tar.gz'
    sha1 '980bf6cf02c074d3a70b9dbb262358e0518461b8'
  end

  depends_on 'sdl'
  depends_on 'readline'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--without-x",
                          "--enable-readline"
    system "make"

    # We need to run 'make install' without parallelization, because
    # of a race that may cause the 'install' utility to fail when
    # two instances concurrently create the same parent directories.
    ENV.deparallelize
    system "make install"
  end

  test do
    system "#{bin}/pce-ibmpc", "-V"
  end
end
