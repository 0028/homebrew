require 'formula'

class Proguard < Formula
  homepage 'http://proguard.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/proguard/proguard/4.11/proguard4.11.tar.gz'
  sha256 '90a4dbf8c016fd84da6d48d8b16e450ee07abafbfb7bb6eb5028651a8c255d9e'

  bottle do
    sha1 'f5a5dd80d8f59a933f7baee8efe8589d35c990f6' => :mavericks
    sha1 '56b617b1824694ef5b5844af3616dc9b83f15373' => :mountain_lion
    sha1 '41553e2362b30d5a150ba310facb1ac6d05a6989' => :lion
  end

  def install
    libexec.install 'lib/proguard.jar'
    bin.write_jar_script libexec/'proguard.jar', 'proguard'
  end
end
