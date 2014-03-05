require 'formula'

class Tcpflow < Formula
  homepage 'https://github.com/simsong/tcpflow'
  url 'http://www.digitalcorpora.org/downloads/tcpflow/tcpflow-1.4.4.tar.gz'
  sha1 'e4bc5ad08a81a39943bd1c799edefcdee09de784'

  bottle do
    cellar :any
    sha1 "c9323dfd764f2847a9b8a484e96e21623e36338b" => :mavericks
    sha1 "531a9e050de7caee286bc80ad7fe86ad1f2bbc15" => :mountain_lion
    sha1 "b5fc875ba51ee4181dbc01ee9deece560f901ed4" => :lion
  end

  head do
    url 'https://github.com/simsong/tcpflow.git'
    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'boost' => :build
  depends_on 'sqlite' if MacOS.version < :lion

  def install
    system "bash", "./bootstrap.sh" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
