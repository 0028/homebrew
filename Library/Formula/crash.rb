require 'formula'

class Crash < Formula
  homepage 'http://www.crashub.org/'
  url 'https://crsh.googlecode.com/files/crash-1.2.8.tar.gz'
  sha1 '12290cd227b20eae07674f8cf0d43ee58732e34b'

  bottle do
    cellar :any
    sha1 'd4152e18d7fea4fcf6caa6729e2b2782b887020b' => :mavericks
    sha1 'cfcfda26ebe4d0ed5144ee2b6d6531d0a0bd7c39' => :mountain_lion
    sha1 'e244e81c45a5f22ba4ac7344cb1a6f19d3ad352c' => :lion
  end

  devel do
    url 'https://crsh.googlecode.com/files/crash-1.3.0-beta14.tar.gz'
    sha1 '80ba0af7c951998094761160d1b034c712d9eccc'

    resource 'docs' do
      url 'https://crsh.googlecode.com/files/crash-1.3.0-beta14-docs.tar.gz'
      version '1.3.0-beta14'
      sha1 '7876c9a176361ae13de5ae505f1e3e5df642416b'
    end
  end

  resource 'docs' do
    url 'https://crsh.googlecode.com/files/crash-1.2.8-docs.tar.gz'
    sha1 'ea385cf28c9c8fc0512d8809bf511c37a5be8e1a'
  end

  def install
    doc.install resource('docs')
    libexec.install Dir['crash/*']
    bin.install_symlink "#{libexec}/bin/crash.sh"
  end
end
