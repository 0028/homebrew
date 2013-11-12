require 'formula'

class Zeromq < Formula
  homepage 'http://www.zeromq.org/'
  url 'http://download.zeromq.org/zeromq-4.0.1.tar.gz'
  sha1 '50d894108a26a610eb22cd425cc487480e898acc'

  bottle do
    sha1 '8da751031b49e06295ad4274ff057dbf014093df' => :mavericks
    sha1 'bec0ea43018ae14f16f67d23f3ce6da151e0e617' => :mountain_lion
    sha1 '3e63021720681c5f7c1a51e55efe5c15c8973f41' => :lion
  end

  head do
    url 'https://github.com/zeromq/libzmq.git'

    depends_on :automake
    depends_on :libtool
  end


  option :universal
  option 'with-pgm', 'Build with PGM extension'

  depends_on 'pkg-config' => :build
  depends_on 'libpgm' if build.include? 'with-pgm'
  depends_on 'libsodium' => :optional

  def install
    ENV.universal_binary if build.universal?

    args = ["--disable-dependency-tracking", "--prefix=#{prefix}"]
    if build.include? 'with-pgm'
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
