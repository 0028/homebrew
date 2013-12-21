require 'formula'

class Sassc < Formula
  homepage 'https://github.com/hcatlin/sassc'
  url 'https://github.com/hcatlin/sassc/archive/v1.0.1.tar.gz'
  sha1 '69e7d97264b252593a3307330a96a5ccdc2813b5'

  bottle do
    cellar :any
    sha1 '5a8974c56c7269680b96708a45639861a8b4ab38' => :mavericks
    sha1 '7389c54428963a44d2dd5d593e1f87e390d0d41f' => :mountain_lion
    sha1 '27f2bc54e01fa783fae1b8b5edc9eee3210947cc' => :lion
  end

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'libsass'

  def install
    system "autoreconf -i"
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  test do
    (testpath/"test.sass").write "a { color:blue; &:hover { color:red; } }"
    expected = <<-EOS.undent
      a {
        color: blue; }
        a:hover {
          color: red; }
    EOS
    assert_equal expected, `#{bin}/sassc test.sass`
  end
end
