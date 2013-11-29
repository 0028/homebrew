require 'formula'

class Dirt < Formula
  homepage 'https://github.com/yaxu/Dirt'
  head 'https://github.com/yaxu/Dirt.git'
  url 'https://github.com/yaxu/Dirt/archive/1.0.tar.gz'
  sha1 '853d6a80bf77ebceabd25411ea01568d9acb3362'

  bottle do
    cellar :any
    sha1 '365a1c5f99ae31aff4c1afedcd237a81d58eab9f' => :mavericks
    sha1 '0c52c927687c105c8dc1484452d918c3cf8de170' => :mountain_lion
    sha1 '7975c151c9bdcc8fd0d67850f471851a47938f3f' => :lion
  end

  depends_on 'jack'
  depends_on 'liblo'

  def install
    system "make", "DESTDIR=#{prefix}", "install"
  end

  test do
    system "#{bin}/dirt", "-h"
  end
end
