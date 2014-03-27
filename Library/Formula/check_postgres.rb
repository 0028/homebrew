require "formula"

class CheckPostgres < Formula
  homepage "http://bucardo.org/wiki/Check_postgres"
  url "http://bucardo.org/downloads/check_postgres-2.21.0.tar.gz"
  sha1 "88ddb1c35a8da0feeaad90036dd27d778551a36d"

  head "https://github.com/bucardo/check_postgres.git"

  option "with-tests", "run tests"

  if build.with? "tests"
    depends_on "pgbouncer" => :build
    depends_on "postgresql" => :build
    depends_on "DBD::Pg" => [:perl, :build]
  end

  def install
    system "perl", "Makefile.PL", "PREFIX=#{prefix}"
    system "make"
    system "make", "test" if build.with? "tests"
    system "make", "install"
    mv bin/"check_postgres.pl", bin/"check_postgres"
    inreplace [bin/"check_postgres", man1/"check_postgres.1p"], "check_postgres.pl", "check_postgres"
  end

  test do
    system bin/"check_postgres", "--version"
  end
end
