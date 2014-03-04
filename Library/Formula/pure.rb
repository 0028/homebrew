require 'formula'

class Pure < Formula
  homepage 'http://purelang.bitbucket.org/'
  url 'https://bitbucket.org/purelang/pure-lang/downloads/pure-0.59.tar.gz'
  sha1 '22614d77fff9937a53cf513767fdc5e8eeb4aae1'

  bottle do
    sha1 "1a84facf775c972077f6358b6248de79dbb8d6bd" => :mavericks
    sha1 "eb6eaa93951ac7de8ed3318a763be17b5b117e82" => :mountain_lion
    sha1 "9e26e112e0d57fea88c44e32307b5b1d14898c08" => :lion
  end

  depends_on :automake
  depends_on :libtool

  depends_on 'llvm'
  depends_on 'gmp'
  depends_on 'readline'
  depends_on 'mpfr'

  resource 'docs' do
    url 'https://bitbucket.org/purelang/pure-lang/downloads/pure-docs-0.59.tar.gz'
    sha1 '55794cea62dcdec093c37bbf68dba6f2dc2e9f9f'
  end

  def install
    system "./configure", "--disable-debug",
                          "--prefix=#{prefix}",
                          "--enable-release",
                          "--without-elisp"
    system "make"
    system "make install"
    resource('docs').stage { system "make", "prefix=#{prefix}", "install" }
  end

  test do
    system "#{bin}/pure", "--version"
  end
end
