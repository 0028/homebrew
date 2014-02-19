require 'formula'

class Duti < Formula
  homepage 'http://duti.org/'
  head 'https://github.com/fitterhappier/duti.git'
  url 'https://github.com/moretension/duti/archive/duti-1.5.2.tar.gz'
  sha1 '1833c0a56646a132fa09bcb31c557d4393f19a3b'

  bottle do
    cellar :any
    sha1 "4f00c0593fb28723880810e5996474e24aeb02c0" => :mavericks
    sha1 "a09f4b71427a6178f61b89ba32aeab369973ae64" => :mountain_lion
    sha1 "833ef0363275a7854e2b225c876c80583eda8097" => :lion
  end

  depends_on :autoconf

  def install
    system "autoreconf", "-vfi"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/duti", "-x", "txt"
  end
end
