require 'formula'

class Felix < Formula
  homepage 'http://felix.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=/felix/org.apache.felix.main.distribution-4.2.1.tar.gz'
  sha1 '96322a8ccf802feb1151316b3367cac273f58823'

  bottle do
    cellar :any
    sha1 '17685b0b4471f0280548d9e3c5b6d9ce4e86b6d9' => :mavericks
    sha1 '825caa98786420951d920402955c6b67f33dbd3a' => :mountain_lion
    sha1 '2470f331ef55c0120e5964501b811dca828076b5' => :lion
  end

  def install
    libexec.install Dir['bin/*']
    prefix.install %w[conf bundle doc]
  end
end
