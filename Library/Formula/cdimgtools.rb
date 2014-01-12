require 'formula'

class Cdimgtools < Formula
  homepage 'http://home.gna.org/cdimgtools/'
  url 'http://download.gna.org/cdimgtools/cdimgtools-0.3.tar.gz'
  sha1 'bc4d9f7b50aa59e3f4f32fc61c01b6a8241eb1af'
  head 'https://git.gitorious.org/cdimgtools/cdimgtools.git'

  bottle do
    cellar :any
    sha1 '3449136ed1d412969d10ba6a512be73f4aa70a60' => :mavericks
    sha1 '050151b33a1b3803862ce565ddb83977c50dd17f' => :mountain_lion
    sha1 'd49a9a25f90aced1c0734b3d42b38d9a5c33d6ff' => :lion
  end

  depends_on 'libdvdcss'
  depends_on 'libdvdread'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install", "install-doc-man"
  end

  test do
    system "#{bin}/dvdimgdecss", "-V"
    system "#{bin}/cssdec", "-V"
  end
end
