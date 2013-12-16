require 'formula'

class Launch4j < Formula
  homepage 'http://launch4j.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/launch4j/launch4j-3/3.1.0-beta2/launch4j-3.1.0-beta2-macosx-x86.tgz'
  sha1 '4a633263539613e63bc0d9c8e14dda234008f960'
  version '3.1.0-beta2'

  bottle do
    sha1 '2b883112272d8c6361db3bffa5c85740aa851011' => :mavericks
    sha1 'bd20ec6aa26d4c1d0643e8313e18cb583bed10c8' => :mountain_lion
    sha1 'f440d890612f70945a959b2ef8cc78df919ed5f5' => :lion
  end

  def install
    libexec.install Dir['*'] - ['src', 'web']
    bin.write_jar_script libexec/"launch4j.jar", "launch4j"
  end
end
