require 'formula'

class Megatools < Formula
  homepage 'http://megatools.megous.com'
  url 'http://megatools.megous.com/builds/megatools-1.9.91.tar.gz'
  sha1 '8e3ecab2020ec31444ed75ca4e92ea75ad4c9354'
  head 'https://github.com/megous/megatools.git'

  bottle do
    cellar :any
    sha1 'baa22842e2b7e648d283bd28d0e756968804e20c' => :mavericks
    sha1 '9995be2f8b01f3eb84b88f46b1b2395de91af03d' => :mountain_lion
    sha1 '40d9bfef28431a81defd199ff2a53bbbedfdb6fd' => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'curl'
  depends_on 'glib-networking' => 'with-curl-ca-bundle'
  depends_on 'osxfuse'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"

    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "megals", "--version"
  end
end
