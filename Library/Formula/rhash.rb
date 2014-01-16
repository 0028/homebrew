require 'formula'

class Rhash < Formula
  homepage 'http://rhash.anz.ru/'
  url 'http://downloads.sourceforge.net/project/rhash/rhash/1.3.1/rhash-1.3.1-src.tar.gz'
  sha1 '3ecba2786909cc0d8bff253d94b0f313cbf2a6b1'

  bottle do
    cellar :any
    sha1 '9b6ef937e4fc15779b8658e1ff13d45753a0debf' => :mavericks
    sha1 'ab1f880d0a09db02b32bad6de3851d1cc97aebbd' => :mountain_lion
    sha1 '63c8baef6c0c72b8ffe823627b0932836f6aa3c9' => :lion
  end

  def install
    # install target isn't parallel-safe
    ENV.j1

    system 'make', 'install', "PREFIX=",
                              "DESTDIR=#{prefix}",
                              "CC=#{ENV.cc}"
  end
end
