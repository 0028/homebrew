require 'formula'

class Help2man < Formula
  homepage 'http://www.gnu.org/software/help2man/'
  url 'http://ftpmirror.gnu.org/help2man/help2man-1.45.1.tar.xz'
  bottle do
    cellar :any
    sha1 "6953cd6a82eb8bb33601edec88cf24036ee88cbf" => :mavericks
    sha1 "0f50faddc5280923076aa08a7b6de8c822ffb633" => :mountain_lion
    sha1 "ae536876cbfce22ac62ce74920d0db6893e62c5e" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/help2man/help2man-1.45.1.tar.xz'
  sha256 'c70fc791e6d13240327955de355244371b00bb1c9e247d5693ed601b716467c2'

  def install
    # install is not parallel safe
    # see https://github.com/Homebrew/homebrew/issues/12609
    ENV.j1

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
