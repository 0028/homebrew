require 'formula'

class Bup < Formula
  homepage 'https://github.com/bup/bup'
  head 'https://github.com/bup/bup.git', :branch => 'master'
  url 'https://github.com/bup/bup/archive/0.25.tar.gz'
  sha1 'f32ba39582d0e8875632f282c54f7377ed2a4df9'

  bottle do
    cellar :any
    sha1 '898d6705848660a7f7a855244dc0e8b227bf03a8' => :mavericks
    sha1 'd82980785cceeb2a7756bc34ff00fd83c3137dd0' => :mountain_lion
    sha1 '229b74cebdeb9ba623954ea68d0b170935182e66' => :lion
  end

  option "run-tests", "Run unit tests after compilation"

  depends_on :python

  def install
    python do
      system "make"
    end
    system "make test" if build.include? "run-tests"
    system "make", "install", "DESTDIR=#{prefix}", "PREFIX="
  end
end
