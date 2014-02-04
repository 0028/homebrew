require 'formula'

class Htmlcleaner < Formula
  homepage 'http://htmlcleaner.sourceforge.net/index.php'
  url 'http://downloads.sourceforge.net/project/htmlcleaner/htmlcleaner/htmlcleaner%20v2.7/htmlcleaner-2.7.zip'
  sha1 'dc9032cbce6dfa2abd2eae060aa146a0d6af9d9f'

  bottle do
    sha1 "2d4e2bcee5ec77e15bc8cf8d873472582f3397bf" => :mavericks
    sha1 "fbf9ee59e25c029c4ef5cf274d67cacb2ca4570c" => :mountain_lion
    sha1 "b09f85e9da98f11d66bc0789969e8bc45846fc87" => :lion
  end

  def install
    libexec.install "htmlcleaner-#{version}.jar"
    bin.write_jar_script libexec/"htmlcleaner-#{version}.jar", "htmlcleaner"
  end

  test do
    path = testpath/"index.html"
    path.write "<html>"

    output = `#{bin}/htmlcleaner src=#{path}`
    assert output.include?("</html>")
    assert_equal 0, $?.exitstatus
  end
end
