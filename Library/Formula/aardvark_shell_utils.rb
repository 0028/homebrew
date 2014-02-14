require 'formula'

class AardvarkShellUtils < Formula
  homepage 'http://www.laffeycomputer.com/shellutils.html'
  url 'http://downloads.laffeycomputer.com/current_builds/shellutils/aardvark_shell_utils-1.0.tar.gz'
  sha1 '8cee29059038ebec96c3a97978d18a5a4941da06'

  bottle do
    cellar :any
    sha1 "f2222df547897558b6b534b29983cf9d2113a627" => :mavericks
    sha1 "de380d890d908deca8e211cb15a57b11d21edcf9" => :mountain_lion
    sha1 "3ef1e2319e249fd46be4d5e6afea81ddabc365fe" => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make"
    system "make install"
  end

  test do
    output = `#{bin}/filebase movcpm.com`
    assert_equal "movcpm\n", output
    assert_equal 0, $?.exitstatus

    output = `#{bin}/fileext movcpm.com`
    assert_equal "com\n", output
    assert_equal 0, $?.exitstatus

    output = `#{bin}/realpath .`
    assert_equal "#{testpath}\n", output
    assert_equal 0, $?.exitstatus
  end
end
