require 'formula'

class Pdns < Formula
  homepage 'http://wiki.powerdns.com'
  url 'http://downloads.powerdns.com/releases/pdns-3.3.1.tar.gz'
  sha1 '555862bf9635d1dcab2c4f3b7569bdd8212ef67f'

  bottle do
    sha1 '1c3518ecd3b866dd0a7c609838dc5c43b67ef641' => :mavericks
    sha1 '0302a05785e8ae296f7d4ea9478f019789271850' => :mountain_lion
    sha1 '9394df3b2eea9e00e2092c785c9f0009044b318f' => :lion
  end

  option 'pgsql', 'Enable the PostgreSQL backend'

  depends_on 'pkg-config' => :build
  depends_on 'boost'
  depends_on 'lua'
  depends_on 'sqlite'
  depends_on :postgresql if build.include? 'pgsql'

  def install
    args = ["--prefix=#{prefix}",
            "--with-lua",
            "--with-sqlite3",
            "--with-sqlite=#{Formula.factory("sqlite").opt_prefix}"]

    # Include the PostgreSQL backend if requested
    if build.include? "pgsql"
      args << "--with-modules=gsqlite3 gpgsql"
    else
      # SQLite3 backend only is the default
      args << "--with-modules=gsqlite3"
    end

    system "./configure", *args

    # Compilation fails at polarssl if we skip straight to make install
    system "make"
    system "make install"

  end
end
