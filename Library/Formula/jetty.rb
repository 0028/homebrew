require 'formula'

class Jetty < Formula
  homepage 'http://www.eclipse.org/jetty/'
  url 'http://eclipse.org/downloads/download.php?file=/jetty/9.1.0.v20131115/dist/jetty-distribution-9.1.0.v20131115.tar.gz&r=1'
  version '9.1.0'
  sha1 '50e6a8e45581fc111922cdaada93b9eea27ae937'

  bottle do
    sha1 '31d134b05f9a2a3ae700e9603d9eecceb03cfe77' => :mavericks
    sha1 '88f8f615e8700a5f4c25abf1c69d2abf65de50eb' => :mountain_lion
    sha1 '7bc91c50894f11ffad130643c533b15d692bd5e6' => :lion
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
