require 'formula'

class Dos2unix < Formula
  homepage 'http://waterlan.home.xs4all.nl/dos2unix.html'
  url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.4.tar.gz'
  sha1 '93d73148c09908a42dcbf5339312c9aa1f18ba7c'

  bottle do
    sha1 "6543edb7282d7b06e68cc1436f2c01e927497c29" => :mavericks
    sha1 "c6536faa25386e11c6efd51dcce32fa8b8ea8b64" => :mountain_lion
    sha1 "021be0d580ce1205d57d2bda02c15a17ea7e2b82" => :lion
  end

  depends_on 'gettext'

  devel do
    url 'http://waterlan.home.xs4all.nl/dos2unix/dos2unix-6.0.5-beta11.tar.gz'
    sha1 'f7d17dc4dbf723c81d1459b9664fc8045a77541d'
  end

  def install
    gettext = Formula["gettext"]
    system "make", "prefix=#{prefix}",
                   "CC=#{ENV.cc}",
                   "CPP=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "CFLAGS_OS=-I#{gettext.include}",
                   "LDFLAGS_EXTRA=-L#{gettext.lib} -lintl",
                   "install"
  end

  test do
    path = testpath/"test.txt"
    path.write "foo\r\nbar\r\n"

    system "#{bin}/dos2unix", path
    assert_equal "foo\nbar\n", path.read
  end
end
