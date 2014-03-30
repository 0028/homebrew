require "formula"

class PostgresqlInstalled < Requirement
  fatal true
  default_formula "postgresql"

  satisfy { which "pg_config" }
end

class Psqlodbc < Formula
  homepage "http://www.postgresql.org/"
  url "http://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-09.03.0210.tar.gz"
  sha1 "e1eb147ef0452e1f7b0f9e102dacb5654a580dba"

  bottle do
    cellar :any
    sha1 "fa89524e2780a83630707e51bf13e744245d14c8" => :mavericks
    sha1 "4063c917e481285501be7961a1d8be458e29244a" => :mountain_lion
    sha1 "8a021c16c1f118e3614a2dd57cfa626c34fed65b" => :lion
  end

  depends_on "openssl"
  depends_on "unixodbc"
  depends_on PostgresqlInstalled

  def install
    args = ["--prefix=#{prefix}",
            "--with-unixodbc=#{Formula['unixodbc'].prefix}"]

    system "./configure", *args
    system "make"
    system "make", "install"
  end

  test do
    output = `#{Formula['unixodbc'].bin}/dltest #{lib}/psqlodbcw.so`
    assert_equal "SUCCESS: Loaded #{lib}/psqlodbcw.so\n", output
    assert_equal 0, $?.exitstatus
  end
end
