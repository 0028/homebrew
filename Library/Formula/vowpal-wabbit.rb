require 'formula'

class VowpalWabbit < Formula
  homepage 'https://github.com/JohnLangford/vowpal_wabbit'
  url 'https://github.com/JohnLangford/vowpal_wabbit/archive/7.5.tar.gz'
  sha1 '2f7602a54df2e6aa2d8a54baaaceb47098a74dce'

  bottle do
    cellar :any
    sha1 "0c7c647bc7897d04ed86e466054bfef118260ea5" => :mavericks
    sha1 "e6d39082b170109767879459dca6c3125a8fd5bd" => :mountain_lion
    sha1 "92e4b0362a5304c961fe4b9c380e133c17e6864f" => :lion
  end

  head do
    url 'https://github.com/JohnLangford/vowpal_wabbit.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  depends_on 'boost' => :build

  def install
    if build.head?
      inreplace 'autogen.sh' do |s|
        s.gsub! '/usr/share/aclocal', "#{HOMEBREW_PREFIX}/share/aclocal"
      end
      system "./autogen.sh"
    end

    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end
