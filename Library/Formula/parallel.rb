require 'formula'

class Parallel < Formula
  homepage 'http://savannah.gnu.org/projects/parallel/'
  url 'http://ftpmirror.gnu.org/parallel/parallel-20131222.tar.bz2'
  bottle do
    cellar :any
    sha1 '9dec593e9060d7b93a91cb0a784c3f041216f82a' => :mavericks
    sha1 'e2180a313c81efdcba15cd92f1f3e935022ad68c' => :mountain_lion
    sha1 'ebf9a314c2c88ebf0e800183ae21dcacba5c32f6' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/parallel/parallel-20131222.tar.bz2'
  sha256 '6772be4d236de1696c1d7f84eee00f36d0a69da28c845c8730c38816c9eaef21'

  conflicts_with 'moreutils',
    :because => "both install a 'parallel' executable."

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
