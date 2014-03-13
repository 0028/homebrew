require 'formula'

class Cabocha < Formula
  homepage 'http://code.google.com/p/cabocha/'
  url 'https://cabocha.googlecode.com/files/cabocha-0.68.tar.bz2'
  sha1 '5e22a71eb86d778fdeb1b725c0b27f1fb4af7f4b'

  bottle do
    sha1 "a286b765555604952b67c0e7ee6c545c645ccf5b" => :mavericks
    sha1 "e33604e538567c7c0bc12243b0e971eb4a71a469" => :mountain_lion
    sha1 "2d69d16ae19bc6cd677c133826bbc1ad0ad0ac2f" => :lion
  end

  depends_on 'crf++'
  depends_on 'mecab'

  option 'posset', 'choose default posset: IPA, JUMAN, UNIDIC'

  def install
    ENV["LIBS"] = '-liconv'

    inreplace 'Makefile.in' do |s|
      s.change_make_var! 'CFLAGS', ENV.cflags
      s.change_make_var! 'CXXFLAGS', ENV.cflags
    end

    posset = ARGV.value('posset') || "IPA"
    args = ["--with-charset=utf8",
            "--disable-dependency-tracking",
            "--prefix=#{prefix}"]
    args << "--with-posset=#{posset}"

    system "./configure", *args
    system "make install"
  end
end
