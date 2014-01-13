require 'formula'

class Tcpflow < Formula
  homepage 'https://github.com/simsong/tcpflow'
  url 'http://www.digitalcorpora.org/downloads/tcpflow/tcpflow-1.4.4.tar.gz'
  sha1 'e4bc5ad08a81a39943bd1c799edefcdee09de784'

  bottle do
    cellar :any
    sha1 '03fcda9f3649c5abdb748d1ad7db19cac7e9d813' => :mavericks
    sha1 '451dcaadc4f929b40651594d5d55c342e9af7e11' => :mountain_lion
    sha1 '1ff034adb0e07a90fefd723198eecd8e647e364e' => :lion
  end

  head do
    url 'https://github.com/simsong/tcpflow.git'
    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'boost' => :build

  def install
    system "bash", "./bootstrap.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
