require 'formula'

class SwiProlog < Formula
  homepage 'http://www.swi-prolog.org/'
  url 'http://www.swi-prolog.org/download/stable/src/pl-6.6.1.tar.gz'
  sha1 '94022f4c26d86761e3b998c21da400e0fce4acb3'

  bottle do
    sha1 '543e1ef1a170f8ef35ea099722800aac4eeabd56' => :mavericks
    sha1 '49b4fa7ba5c65a0bcb3e2b7d4ace9369951bde07' => :mountain_lion
    sha1 '744712ad9e176d546b733dacfe5f0e4ba7d52ce0' => :lion
  end

  devel do
    url 'http://www.swi-prolog.org/download/devel/src/pl-7.1.4.tar.gz'
    sha1 '4decc65614af0b68ca3d2e52a2f81ff31afb581f'
  end

  head do
    url 'git://www.swi-prolog.org/home/pl/git/pl.git'

    depends_on :autoconf
  end

  option 'lite', "Disable all packages"
  option 'with-jpl', "Enable JPL (Java Prolog Bridge)"
  option 'with-xpce', "Enable XPCE (Prolog Native GUI Library)"

  depends_on 'readline'
  depends_on 'gmp'

  if build.include? 'with-xpce'
    depends_on 'pkg-config' => :build
    depends_on :x11
    depends_on 'jpeg'
  end

  # 10.5 versions of these are too old
  if MacOS.version <= :leopard
    depends_on 'fontconfig'
    depends_on 'expat'
  end

  fails_with :llvm do
    build 2335
    cause "Exported procedure chr_translate:chr_translate_line_info/3 is not defined"
  end

  def install
    args = ["--prefix=#{libexec}", "--mandir=#{man}"]
    ENV.append 'DISABLE_PKGS', "jpl" unless build.include? "with-jpl"
    ENV.append 'DISABLE_PKGS', "xpce" unless build.include? 'with-xpce'

    # SWI-Prolog's Makefiles don't add CPPFLAGS to the compile command, but do
    # include CIFLAGS. Setting it here. Also, they clobber CFLAGS, so including
    # the Homebrew-generated CFLAGS into COFLAGS here.
    ENV['CIFLAGS'] = ENV.cppflags
    ENV['COFLAGS'] = ENV.cflags

    # Build the packages unless --lite option specified
    args << "--with-world" unless build.include? "lite"

    # './prepare' prompts the user to build documentation
    # (which requires other modules). '3' is the option
    # to ignore documentation.
    system "echo '3' | ./prepare" if build.head?
    system "./configure", *args
    system "make"
    system "make install"

    bin.write_exec_script Dir["#{libexec}/bin/*"]
  end

  def test
    system "#{bin}/swipl", "--version"
  end
end
