require 'formula'

class Jetty < Formula
  homepage 'http://www.eclipse.org/jetty/'
  url 'http://eclipse.org/downloads/download.php?file=/jetty/9.1.3.v20140225/dist/jetty-distribution-9.1.3.v20140225.tar.gz&r=1'
  version '9.1.3'
  sha1 '09cc96d187ad07bc86414b123475d0fe2d25e255'

  bottle do
    cellar :any
    sha1 "9962b71d834416760552681aeaf2defcdc32e3c6" => :mavericks
    sha1 "b12d9209c61e4b956d14642f16d18dd801616c52" => :mountain_lion
    sha1 "d5aa1ae3f0d2126bc75b5af992ff775c0d4cbf48" => :lion
  end

  def install
    rm_rf Dir['bin/*.{cmd,bat]}']

    libexec.install Dir['*']
    (libexec+'logs').mkpath

    bin.mkpath
    Dir["#{libexec}/bin/*.sh"].each do |f|
      scriptname = File.basename(f, '.sh')
      (bin+scriptname).write <<-EOS.undent
        #!/bin/bash
        JETTY_HOME=#{libexec}
        #{f} $@
      EOS
      chmod 0755, bin+scriptname
    end
  end
end
