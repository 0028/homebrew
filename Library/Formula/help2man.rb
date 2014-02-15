require 'formula'

class Help2man < Formula
  homepage 'http://www.gnu.org/software/help2man/'
  url 'http://ftpmirror.gnu.org/help2man/help2man-1.44.1.tar.xz'
  bottle do
    cellar :any
    sha1 "7220db62a637760b02a59e8400dad1d779fe2388" => :mavericks
    sha1 "2b724da95b82a9595c3c5f42888a863b07ff9332" => :mountain_lion
    sha1 "db99db763033969459e37418b719484024a06004" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/help2man/help2man-1.44.1.tar.xz'
  sha256 '22de6846771921f455e389cdca07119d7f55b1877685b42dd5bbb9fc1377defb'

  def install
    # install is not parallel safe
    # see https://github.com/Homebrew/homebrew/issues/12609
    ENV.j1

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
