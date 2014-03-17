require 'formula'

class Languagetool < Formula
  homepage 'http://www.languagetool.org/'
  url 'https://www.languagetool.org/download/LanguageTool-2.4.1.zip'
  sha1 '47ca4ee2da377450056eb386a2b88e4a077a94a5'

  bottle do
    cellar :any
    sha1 "7d5f8e328ec0d4c4e52da7a5f83f715129bd0635" => :mavericks
    sha1 "c032e727821af1656a327c0165411ef5d1a24a32" => :mountain_lion
    sha1 "92621b63b16f5540a63d20ab441d12ef35b2fa1b" => :lion
  end

  def server_script server_jar; <<-EOS.undent
    #!/bin/bash
    exec java -cp #{server_jar} org.languagetool.server.HTTPServer "$@"
    EOS
  end

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'languagetool-commandline.jar', 'languagetool'
    (bin+'languagetool-server').write server_script(libexec/'languagetool-server.jar')
    bin.write_jar_script libexec/'languagetool-standalone.jar', 'languagetool-gui'
  end
end
