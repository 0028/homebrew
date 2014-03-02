require 'formula'

class Htmlcleaner < Formula
  homepage 'http://htmlcleaner.sourceforge.net/index.php'
  url 'https://downloads.sourceforge.net/project/htmlcleaner/htmlcleaner/htmlcleaner%20v2.7/htmlcleaner-2.7.zip'
  sha1 'dc9032cbce6dfa2abd2eae060aa146a0d6af9d9f'

  bottle do
    sha1 "27aab69bdcb94e70e3a8f667ae350ef454399f63" => :mavericks
    sha1 "1119bd5936e0541c4b8081a0168719949058315f" => :mountain_lion
    sha1 "2d46040fd2b8428473c26c11c25fbe892f53665d" => :lion
  end

  def install
    libexec.install "htmlcleaner-#{version}.jar"
    bin.write_jar_script libexec/"htmlcleaner-#{version}.jar", "htmlcleaner"
  end

  test do
    path = testpath/"index.html"
    path.write "<html>"
    assert shell("#{bin}/htmlcleaner src=#{path}").include?("</html>")
  end
end
