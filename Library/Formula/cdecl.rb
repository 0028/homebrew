require 'formula'

class Cdecl < Formula
  homepage 'http://cdecl.org/'
  url 'http://cdecl.org/files/cdecl-blocks-2.5.tar.gz'
  sha1 '3fb349970859dfd32a7fb502cecbd3c6d8656af1'

  bottle do
    cellar :any
    sha1 "20660bb4e163d839bca2c801272e147e4fad1f3e" => :mavericks
    sha1 "528a94ef23a571d242dd584bcb419940c89bbd79" => :mountain_lion
    sha1 "700af256830ce4057bc215d68f934497e4bd12af" => :lion
  end

  def install
    # Fix namespace clash with Lion's getline
    inreplace "cdecl.c", "getline", "cdecl_getline"

    bin.mkpath
    man1.mkpath

    ENV.append 'CFLAGS', '-DBSD -DUSE_READLINE -std=gnu89'

    system "make", "CC=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "LIBS=-lreadline",
                   "BINDIR=#{bin}",
                   "MANDIR=#{man1}",
                   "install"
  end

  test do
    output = `#{bin}/cdecl explain int *a`.strip
    assert_equal "declare a as pointer to int", output
    assert_equal 0, $?.exitstatus
  end
end
