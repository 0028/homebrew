require 'formula'

class GroongaNormalizerMysql < Formula
  homepage 'https://github.com/groonga/groonga-normalizer-mysql'
  url 'http://packages.groonga.org/source/groonga-normalizer-mysql/groonga-normalizer-mysql-1.0.6.tar.gz'
  sha1 '61d27a4782d4821be7d26e07cf207c6d7f719ebf'

  bottle do
    cellar :any
    sha1 "3e15df98e2c5dc698afd9a8d1e1f794ec6b71957" => :mavericks
    sha1 "5461a7e7301fdc12da91961ba02014afc3638f99" => :mountain_lion
    sha1 "cfd61e6d0980e373c34b4f7f5b377c31441033f3" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'groonga'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
