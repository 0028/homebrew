require "formula"

class MysqlSearchReplace < Formula
  homepage "https://interconnectit.com/products/search-and-replace-for-wordpress-databases/"
  url "https://github.com/interconnectit/Search-Replace-DB/archive/3.0.0.tar.gz"
  sha1 "9778ffcc26fabf85c49bd6ef98b5a80d0d0365f1"

  bottle do
    cellar :any
    sha1 "133f04a4cacae6b49f5c918a3108abb71160e0c7" => :mavericks
    sha1 "4bbc74d07c04d9d35d150d3a817a24b55a224f8b" => :mountain_lion
    sha1 "b256d72e63dce93ca011eee84f1751a35a83536d" => :lion
  end

  def install
    libexec.install "srdb.class.php"
    libexec.install "srdb.cli.php" => "srdb"
    chmod 0755, libexec/"srdb"
    bin.install_symlink libexec/"srdb"
  end

  test do
    system "srdb", "--help"
  end

  def caveats
    "`srdb --help` to see usage"
  end
end
