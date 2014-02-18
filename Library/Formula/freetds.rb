require 'formula'

class Freetds < Formula
  homepage 'http://www.freetds.org/'
  url 'http://mirrors.ibiblio.org/freetds/stable/freetds-0.91.tar.gz'
  sha1 '3ab06c8e208e82197dc25d09ae353d9f3be7db52'

  bottle do
    sha1 "fdfe2b758e57aa39fc151dd33dded0aeddd907a0" => :mavericks
    sha1 "3375769ef7cc7b42368701b7513a7fd1f694bb56" => :mountain_lion
    sha1 "81295e845fdb4cd55cc4f4dfbdfa9fca60a07d92" => :lion
  end

  head do
    url 'https://git.gitorious.org/freetds/freetds.git'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option :universal
  option "enable-msdblib", "Enable Microsoft behavior in the DB-Library API where it diverges from Sybase's"
  option "enable-sybase-compat", "Enable close compatibility with Sybase's ABI, at the expense of other features"
  option "enable-odbc-wide", "Enable odbc wide, prevent unicode - MemoryError's"

  depends_on "pkg-config" => :build
  depends_on "unixodbc" => :optional

  def install
    system "autoreconf -i" if build.head?

    args = %W[--prefix=#{prefix}
              --with-openssl=#{MacOS.sdk_path}/usr
              --with-tdsver=7.1
              --mandir=#{man}
            ]

    if build.include? "with-unixodbc"
      args << "--with-unixodbc=#{Formula.factory('unixodbc').prefix}"
    end

    if build.include? "enable-msdblib"
      args << "--enable-msdblib"
    end

    if build.include? "enable-sybase-compat"
      args << "--enable-sybase-compat"
    end

    if build.include? "enable-odbc-wide"
      args << "--enable-odbc-wide"
    end

    ENV.universal_binary if build.universal?
    system "./configure", *args
    system 'make'
    ENV.j1 # Or fails to install on multi-core machines
    system 'make install'
  end

  def test
    system "#{bin}/tsql", "-C"
  end
end
