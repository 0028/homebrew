require "formula"

class Ejabberd < Formula
  homepage "http://www.ejabberd.im"
  url "http://www.process-one.net/downloads/ejabberd/13.12/ejabberd-13.12.tgz"
  sha1 "3aedb5012fab49181961ff24bad3af581f4b30ee"

  bottle do
    sha1 "a427eaa49b9a732f738e2e2a6ec7a46259bf92da" => :mavericks
    sha1 "6f812dd83fef91b758f43a82a57164e7fd34de9d" => :mountain_lion
    sha1 "25be2da7f2a98482d1fd0be5fa473f76a03fa934" => :lion
  end

  depends_on "openssl"
  depends_on "erlang"
  depends_on "libyaml"

  option "32-bit"
  option "with-odbc", "Build with ODBC support"
  option "with-pgsql", "Build with PostgreSQL support"
  option "with-mysql", "Build with MySQL support"

  def install
    ENV["TARGET_DIR"] = ENV["DESTDIR"] = "#{lib}/ejabberd/erlang/lib/ejabberd-#{version}"
    ENV["MAN_DIR"] = man
    ENV["SBIN_DIR"] = sbin

    if build.build_32_bit?
      %w{ CFLAGS LDFLAGS }.each do |compiler_flag|
        ENV.remove compiler_flag, "-arch #{Hardware::CPU.arch_64_bit}"
        ENV.append compiler_flag, "-arch #{Hardware::CPU.arch_32_bit}"
      end
    end

    args = ["--prefix=#{prefix}",
            "--sysconfdir=#{etc}",
            "--localstatedir=#{var}"]

    args << "--enable-odbc" if build.with? "odbc"
    args << "--enable-pgsql" if build.with? "pgsql"
    args << "--enable-mysql" if build.with? "mysql"

    system "./configure", *args
    system "make"
    system "make", "install"

    (etc+"ejabberd").mkpath
    (var+"lib/ejabberd").mkpath
    (var+"spool/ejabberd").mkpath
  end

  def caveats; <<-EOS.undent
    If you face nodedown problems, concat your machine name to:
      /private/etc/hosts
    after 'localhost'.
    EOS
  end
end
