require 'formula'

class Tcpflow < Formula
  homepage 'https://github.com/simsong/tcpflow'
  url 'http://www.digitalcorpora.org/downloads/tcpflow/tcpflow-1.4.2.tar.gz'
  sha1 '69c291b4248300ff5caae031a7fa56b533e49779'

  bottle do
    cellar :any
    sha1 'f8e2ae3b0ee7f3ef6e8fbf242f4e5c28d2544881' => :mavericks
    sha1 'ee5068aed793dbf7d4261e4a72e19da9f5c127ed' => :mountain_lion
    sha1 '339b7fa42a4fb2403e4863092b0472d9ca0b2e4a' => :lion
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
