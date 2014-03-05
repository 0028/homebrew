require 'formula'

class Plantuml < Formula
  homepage 'http://plantuml.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/plantuml/plantuml.7994.jar'
  sha1 'b1b619532674b159814ea620a4ec1059eee7faee'

  bottle do
    cellar :any
    sha1 "fd2c91509f0029ed43101b66ddc1e21573fe92ce" => :mavericks
    sha1 "8f5b0e7af6cff5b7abfddb6f0e43cf78e30ff166" => :mountain_lion
    sha1 "b726bae4b458e6507b584d0f7bcdd01e386b3e50" => :lion
  end

  depends_on 'graphviz'

  def install
    jar = "plantuml.#{version}.jar"
    prefix.install jar
    bin.write_jar_script prefix/jar, "plantuml"
  end

  test do
    system "#{bin}/plantuml", "-testdot"
  end
end
