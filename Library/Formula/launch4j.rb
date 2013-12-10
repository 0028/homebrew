require 'formula'

class Launch4j < Formula
  homepage 'http://launch4j.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/launch4j/launch4j-3/3.1.0-beta2/launch4j-3.1.0-beta2-macosx-x86.tgz'
  sha1 '4a633263539613e63bc0d9c8e14dda234008f960'
  version '3.1.0-beta2'


  bottle do
    sha1 'a6d522b8e791386cece9effa16a1abfb22051e94' => :mavericks
    sha1 '42370eac5502868083092d6216a89d2f2c90a34d' => :mountain_lion
    sha1 'cef14c861449bc6c8acde44b99d1fecb3cbf652b' => :lion
  end

  def install
    libexec.install Dir['*'] - ['src', 'web']
    bin.write_jar_script libexec/"launch4j.jar", "launch4j"
  end

  test do
    system "#{bin}/launch4j", "--help"
  end
end
