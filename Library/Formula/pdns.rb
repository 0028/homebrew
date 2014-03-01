require 'formula'

class Pdns < Formula
  homepage 'http://www.powerdns.com'
  head 'https://github.com/powerdns/pdns.git'
  url 'http://downloads.powerdns.com/releases/pdns-3.3.1.tar.gz'
  sha1 '555862bf9635d1dcab2c4f3b7569bdd8212ef67f'

  bottle do
    sha1 "58434a842a19d4f3ecf70baea57b3817e813a8bb" => :mavericks
    sha1 "b2939793ac9bf58c00cf3c45ac048fe6bb9909f2" => :mountain_lion
    sha1 "41551644029d371c8686b8eb384581b2114a27ab" => :lion
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
            "--with-sqlite=#{Formula["sqlite"].opt_prefix}"]

    # Include the PostgreSQL backend if requested
    if build.include? "pgsql"
      args << "--with-modules=gsqlite3 gpgsql"
    else
      # SQLite3 backend only is the default
      args << "--with-modules=gsqlite3"
    end

    if build.head?
      system "./bootstrap"
    end
    system "./configure", *args

    # Compilation fails at polarssl if we skip straight to make install
    system "make"
    system "make install"

  end
end
