require 'formula'

class Vim < Formula
  homepage 'http://www.vim.org/'
  head 'https://vim.googlecode.com/hg/'
  bottle do
    sha1 "9a310c4d7c9fceacc9d16f61b5a3dc93a3fba122" => :mavericks
    sha1 "c6ef9de6b8989a0134ff6f682504878fb32060f2" => :mountain_lion
    sha1 "7d46862cfa8b2140b465748ee3d034fa26e63247" => :lion
  end

  # This package tracks debian-unstable: http://packages.debian.org/unstable/vim
  url 'http://ftp.debian.org/debian/pool/main/v/vim/vim_7.4.161.orig.tar.gz'
  sha1 '111e9a237fa240895db013c1e546dd02580a2940'

  # We only have special support for finding depends_on :python, but not yet for
  # :ruby, :perl etc., so we use the standard environment that leaves the
  # PATH as the user has set it right now.
  env :std

  option "override-system-vi", "Override system vi"
  option "disable-nls", "Build vim without National Language Support (translated messages, keymaps)"
  option "with-client-server", "Enable client/server mode"

  LANGUAGES_OPTIONAL = %w(lua mzscheme perl python3 tcl)
  LANGUAGES_DEFAULT  = %w(ruby python)

  LANGUAGES_OPTIONAL.each do |language|
    option "with-#{language}", "Build vim with #{language} support"
  end
  LANGUAGES_DEFAULT.each do |language|
    option "without-#{language}", "Build vim without #{language} support"
  end

  depends_on :python => :recommended
  depends_on :python3 => :optional
  depends_on 'lua' => :optional
  depends_on 'gtk+' if build.with? 'client-server'

  conflicts_with 'ex-vi',
    :because => 'vim and ex-vi both install bin/ex and bin/view'

  def install
    ENV['LUA_PREFIX'] = HOMEBREW_PREFIX if build.with?('lua')

    # vim doesn't require any Python package, unset PYTHONPATH.
    ENV.delete('PYTHONPATH')

    opts = []
    opts += LANGUAGES_OPTIONAL.map do |language|
      "--enable-#{language}interp" if build.with? language
    end
    opts += LANGUAGES_DEFAULT.map do |language|
      "--enable-#{language}interp" unless build.without? language
    end
    if opts.include? "--enable-pythoninterp" and opts.include? "--enable-python3interp"
      opts = opts - %W[--enable-pythoninterp --enable-python3interp] + %W[--enable-pythoninterp=dynamic --enable-python3interp=dynamic]
    end

    opts << "--disable-nls" if build.include? "disable-nls"

    if build.with? 'client-server'
      opts << '--enable-gui=gtk2'
    else
      opts << "--enable-gui=no"
      opts << "--without-x"
    end

    # XXX: Please do not submit a pull request that hardcodes the path
    # to ruby: vim can be compiled against 1.8.x or 1.9.3-p385 and up.
    # If you have problems with vim because of ruby, ensure a compatible
    # version is first in your PATH when building vim.

    # We specify HOMEBREW_PREFIX as the prefix to make vim look in the
    # the right place (HOMEBREW_PREFIX/share/vim/{vimrc,vimfiles}) for
    # system vimscript files. We specify the normal installation prefix
    # when calling "make install".
    system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
                          "--mandir=#{man}",
                          "--enable-multibyte",
                          "--with-tlib=ncurses",
                          "--enable-cscope",
                          "--with-features=huge",
                          "--with-compiledby=Homebrew",
                          *opts

    # Require Python's dynamic library, and needs to be built as a framework.
    if build.with? "python" and build.with? "python3"
      py_prefix = Pathname.new `python -c "import sys; print(sys.prefix)"`.chomp
      py3_prefix = Pathname.new `python3 -c "import sys; print(sys.prefix)"`.chomp
      # Help vim find Python's dynamic library as absolute path.
      inreplace "src/auto/config.mk", /-DDYNAMIC_PYTHON_DLL=\\".*\\"/,
                   %(-DDYNAMIC_PYTHON_DLL=\'\"#{py_prefix}/Python\"\')
      inreplace "src/auto/config.mk", /-DDYNAMIC_PYTHON3_DLL=\\".*\\"/,
                  %(-DDYNAMIC_PYTHON3_DLL=\'\"#{py3_prefix}/Python\"\')
      # Force vim loading different Python on same time, may cause vim crash.
      inreplace "src/auto/config.h",
                        %r(^(\/\* #undef|#define) PY_NO_RTLD_GLOBAL (\*\/|1)$),
                        "#define PY_NO_RTLD_GLOBAL 1"
      inreplace "src/auto/config.h",
                        %r(^(\/\* #undef|#define) PY3_NO_RTLD_GLOBAL (\*\/|1)$),
                        "#define PY3_NO_RTLD_GLOBAL 1"
    end

    system "make"
    # If stripping the binaries is not enabled, vim will segfault with
    # statically-linked interpreters like ruby
    # http://code.google.com/p/vim/issues/detail?id=114&thanks=114&ts=1361483471
    system "make", "install", "prefix=#{prefix}", "STRIP=/usr/bin/true"
    ln_s 'vim', bin/'vi' if build.include? 'override-system-vi'
  end

  def caveats
    if build.with? "python" and build.with? "python3"
      <<-EOS.undent
        Vim has been built with dynamic loading of Python 2 and Python 3.

        Note: if Vim dynamically loads both Python 2 and Python 3, it may
        crash. For more information, see:
            http://vimdoc.sourceforge.net/htmldoc/if_pyth.html#python3
      EOS
    end
  end
end
