require 'formula'

class Javarepl < Formula
  homepage "https://github.com/albertlatacz/java-repl"
  url "http://albertlatacz.published.s3.amazonaws.com/repo/javarepl/javarepl/261/javarepl-261.jar"
  sha1 "a94f9426b806189adcb04ccb365116966b4d75dc"

  bottle do
    cellar :any
    sha1 "8bb1c5065f296328a23f1bbd7153bfafe9f098eb" => :mavericks
    sha1 "0758fb197cdb93306eea0bbde6cb2143ed321315" => :mountain_lion
    sha1 "ef51a9ec236d9f02c3d3986cd4b9c3c50ceef312" => :lion
  end

  def install
    libexec.install "javarepl-#{version}.jar"
    bin.write_jar_script libexec/"javarepl-#{version}.jar", "javarepl"
  end

  def test
    system "echo :quit | javarepl"
  end

end
