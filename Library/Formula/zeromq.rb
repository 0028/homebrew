require 'formula'

class Zeromq < Formula
  homepage 'http://www.zeromq.org/'
  url 'http://download.zeromq.org/zeromq-4.0.4.tar.gz'
  sha1 '2328014e5990efac31390439b75c5528e38e4490'

  bottle do
    cellar :any
    sha1 "4fc5fe1d10c87d06fa0ffab29f6d9ebcf8c0c3af" => :mavericks
    sha1 "d0c923434c820e99cdf81c9d98a74cc0ebb4852e" => :mountain_lion
    sha1 "b751c4032144704215d1b2957b99fd2de035a194" => :lion
  end

  head do
    url 'https://github.com/zeromq/libzmq.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end


  option :universal
  option 'with-pgm', 'Build with PGM extension'

  depends_on 'pkg-config' => :build
  depends_on 'libpgm' if build.with? "pgm"
  depends_on 'libsodium' => :optional

  def install
    ENV.universal_binary if build.universal?

    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
    if build.with? "pgm"
      # Use HB libpgm-5.2 because their internal 5.1 is b0rked.
      ENV['OpenPGM_CFLAGS'] = %x[pkg-config --cflags openpgm-5.2].chomp
      ENV['OpenPGM_LIBS'] = %x[pkg-config --libs openpgm-5.2].chomp
      args << "--with-system-pgm"
    end

    args << "--with-libsodium" if build.with? 'libsodium'

    system "./autogen.sh" if build.head?
    system "./configure", *args
    system "make"
    system "make install"
  end

  def caveats; <<-EOS.undent
    To install the zmq gem on 10.6 with the system Ruby on a 64-bit machine,
    you may need to do:

        ARCHFLAGS="-arch x86_64" gem install zmq -- --with-zmq-dir=#{opt_prefix}
    EOS
  end
end
