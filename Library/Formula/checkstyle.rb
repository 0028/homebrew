require 'formula'

class Checkstyle < Formula
  homepage 'http://checkstyle.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/checkstyle/checkstyle/5.7/checkstyle-5.7-bin.tar.gz'
  sha1 '232d317391b58d118a0102e8ff289fbaebd0064a'

  bottle do
    sha1 "116a53846e6b3b6d2c9afb7fc91f436449613816" => :mavericks
    sha1 "23cc36fde9c1f43813b7214de4f2f8507b41e361" => :mountain_lion
    sha1 "bc3ad9e5bfccd51d591490ef1574d96434bd9ae5" => :lion
  end

  def install
    libexec.install "checkstyle-#{version}-all.jar", "sun_checks.xml"
    bin.write_jar_script libexec/"checkstyle-#{version}-all.jar", "checkstyle"
  end
end
