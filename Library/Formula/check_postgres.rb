require "formula"

class CheckPostgres < Formula
  homepage "http://bucardo.org/wiki/Check_postgres"
  url "http://bucardo.org/downloads/check_postgres-2.21.0.tar.gz"
  sha1 "88ddb1c35a8da0feeaad90036dd27d778551a36d"

  head "https://github.com/bucardo/check_postgres.git"

  bottle do
    sha1 "b0f3e2aa8e42d3e47fa62905225f41e4caad935f" => :mavericks
    sha1 "f8a00038a7a377a5cd117d2a72d9e71db218986c" => :mountain_lion
    sha1 "a9211edfcead60a87f1eb4803db5ec3d9f989569" => :lion
  end

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
