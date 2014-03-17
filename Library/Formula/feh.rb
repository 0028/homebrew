require 'formula'

class Feh < Formula
  homepage 'http://feh.finalrewind.org/'
  url 'http://feh.finalrewind.org/feh-2.10.tar.bz2'
  sha1 '38b472f2a3222e287269a0719c7ead383f1cb8a5'

  bottle do
    sha1 "b5bcf4f5937c028d510a3c1ed311ce5807398cfc" => :mavericks
    sha1 "d81400b8edb55aebda149630ae3bef693b6a6c5f" => :mountain_lion
    sha1 "a5e0af04e592ee9ded0970be21cfa7a6eade97d9" => :lion
  end

  depends_on :x11
  depends_on 'giblib' => :build

  def install
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end
end
