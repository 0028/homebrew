require 'formula'

class Openssl < Formula
  homepage 'http://openssl.org'
  url 'https://www.openssl.org/source/openssl-1.0.1f.tar.gz'
  mirror 'http://mirrors.ibiblio.org/openssl/source/openssl-1.0.1f.tar.gz'
  sha256 '6cc2a80b17d64de6b7bac985745fdaba971d54ffd7d38d3556f998d7c0c9cb5a'

  bottle do
    revision 1
    sha1 "3a1a125f800c3b1c894f1eae02be0752be0a79c3" => :mavericks
    sha1 "e5eb9e8ee4bbe6a58dd0733a046632d22fa5bea3" => :mountain_lion
    sha1 "3a4c3d61c92f700c62672462d02559a3c8529210" => :lion
  end

  keg_only :provided_by_osx,
    "The OpenSSL provided by OS X is too old for some software."

  def install
    args = %W[./Configure
               --prefix=#{prefix}
               --openssldir=#{openssldir}
               zlib-dynamic
               shared
               enable-cms
             ]

    if MacOS.prefer_64_bit?
      args << "darwin64-x86_64-cc" << "enable-ec_nistp_64_gcc_128"

      inreplace "util/domd", %{expr "$MAKEDEPEND" : '.*gcc$' > /dev/null}, %{true}
      inreplace "util/domd", %{${MAKEDEPEND}}, ENV.cc
    else
      args << "darwin-i386-cc"
    end

    system "perl", *args

    ENV.deparallelize
    system "make", "depend" if MacOS.prefer_64_bit?
    system "make"
    system "make", "test"
    system "make", "install", "MANDIR=#{man}", "MANSUFFIX=ssl"
  end

  def openssldir
    etc/"openssl"
  end

  def cert_pem
    openssldir/"cert.pem"
  end

  def osx_cert_pem
    openssldir/"osx_cert.pem"
  end

  def write_pem_file
    system "security find-certificate -a -p /Library/Keychains/System.keychain > '#{osx_cert_pem}.tmp'"
    system "security find-certificate -a -p /System/Library/Keychains/SystemRootCertificates.keychain >> '#{osx_cert_pem}.tmp'"
    system "mv", "-f", "#{osx_cert_pem}.tmp", osx_cert_pem
  end

  def post_install
    openssldir.mkpath

    if cert_pem.exist?
      write_pem_file
    else
      cert_pem.unlink if cert_pem.symlink?
      write_pem_file
      openssldir.install_symlink 'osx_cert.pem' => 'cert.pem'
    end
  end

  test do
    (testpath/'testfile.txt').write("This is a test file")
    expected_checksum = "91b7b0b1e27bfbf7bc646946f35fa972c47c2d32"
    system "#{bin}/openssl", 'dgst', '-sha1', '-out', 'checksum.txt', 'testfile.txt'
    open("checksum.txt") do |f|
      checksum = f.read(100).split("=").last.strip
      assert_equal checksum, expected_checksum
    end
  end
end
