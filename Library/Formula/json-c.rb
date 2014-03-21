require 'formula'

class JsonC < Formula
  homepage 'https://github.com/json-c/json-c/wiki'
  url 'https://github.com/json-c/json-c/archive/json-c-0.11-20130402.tar.gz'
  version '0.11'
  sha1 '1910e10ea57a743ec576688700df4a0cabbe64ba'

  bottle do
    cellar :any
    revision 1
    sha1 "90014caec33fd7c9d17d3f400aef00b9c4ac49cb" => :mavericks
    sha1 "678595b12948a6492e623c4c6c757108696ae0a9" => :mountain_lion
    sha1 "a5e9891c95950e0d7b25508ad06b5964d6f78649" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    ENV.deparallelize
    system "make install"
  end
end
