require 'formula'

class Checkstyle < Formula
  homepage 'http://checkstyle.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/checkstyle/checkstyle/5.7/checkstyle-5.7-bin.tar.gz'
  sha1 '232d317391b58d118a0102e8ff289fbaebd0064a'

  bottle do
    sha1 "eee225fe34c45979e38c0192b3e663198850f4e2" => :mavericks
    sha1 "5198584584226d550f66f5f9c68de38c826415e1" => :mountain_lion
    sha1 "a1e1f87002ea58f497ba0cd36ada6d920b4e3fa9" => :lion
  end

  def install
    libexec.install "checkstyle-#{version}-all.jar", "sun_checks.xml"
    bin.write_jar_script libexec/"checkstyle-#{version}-all.jar", "checkstyle"
  end

  test do
    path = testpath/"foo.java"
    path.write "public class Foo{ }\n"

    output = `#{bin}/checkstyle -c #{libexec}/sun_checks.xml -r #{path}`
    errors = output.split("\n").select { |line| line.start_with?(path) }
    assert errors.include?("#{path}:1:17: '{' is not preceded with whitespace.")
    assert_equal errors.size, $?.exitstatus
  end
end
