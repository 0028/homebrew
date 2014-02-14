require 'formula'

class Cabocha < Formula
  homepage 'http://code.google.com/p/cabocha/'
  url 'http://cabocha.googlecode.com/files/cabocha-0.67.tar.bz2'
  sha1 '457a9bd0d264a1146a5eb1c5a504dd90a8b51fb8'

  bottle do
    sha1 "5437d57ea060e165e2782cfdd67afbeae635838a" => :mavericks
    sha1 "cb1972d9ba322adb1c16ab44967305765d337379" => :mountain_lion
    sha1 "28160d3ecc5ab6e59b6daf4912b3518907779873" => :lion
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
