require 'formula'

class Jmeter < Formula
  homepage 'http://jmeter.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=jmeter/binaries/apache-jmeter-2.11.tgz'
  sha1 'e9b24f8b5f34565831aafcb046e72bdfa9537386'

  bottle do
    sha1 'cc218a9e5e9df5cac85026588be195a8f19dc4ee' => :mavericks
    sha1 '932fdf60dedbff516a67d9b1f6ce4fb1a367b1b2' => :mountain_lion
    sha1 '55f3c82a0da28b4b49c1ea6b62fe70870e0deeb5' => :lion
  end

  def install
    # Remove windows files
    rm_f Dir["bin/*.bat"]
    prefix.install_metafiles
    libexec.install Dir['*']
    bin.write_exec_script libexec/'bin/jmeter'
  end
end
