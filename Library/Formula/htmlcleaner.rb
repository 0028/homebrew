require 'formula'

class Htmlcleaner < Formula
  homepage 'http://htmlcleaner.sourceforge.net/index.php'
  url 'https://downloads.sourceforge.net/project/htmlcleaner/htmlcleaner/htmlcleaner%20v2.8/htmlcleaner-2.8.zip'
  sha1 'e4cbfebb306fc0baa95205ba91e452c961eebf85'

  bottle do
    cellar :any
    sha1 "494e6eaf76a32ae747733c417b1774b3d06a8775" => :mavericks
    sha1 "b492a48883557e2eb5990f200dbd9d854b61b0f7" => :mountain_lion
    sha1 "71d08954547f5b9c7a29479f81c838095d49aa5e" => :lion
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
