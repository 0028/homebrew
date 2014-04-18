require 'formula'

class Activemq < Formula
  homepage 'http://activemq.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=/activemq/5.9.1/apache-activemq-5.9.1-bin.tar.gz'
  sha1 '03c0730e8de406ad8dc243f5834bf5b74492c5e8'

  bottle do
    cellar :any
    sha1 "737dcea5b91b92c9acf6af6c227d2f2a4fb1320c" => :mavericks
    sha1 "a7821914ee3889740d7600d91fd52b34a13d83d8" => :mountain_lion
    sha1 "240f2f0080decafcacd01db2fe67ce5fce485095" => :lion
  end

  skip_clean 'libexec/webapps/admin/WEB-INF/jsp'

  def install
    rm_rf Dir['bin/linux-x86-*']

    prefix.install_metafiles
    libexec.install Dir['*']

    bin.write_exec_script libexec/'bin/activemq'
    bin.write_exec_script libexec/'bin/activemq-admin'
  end
end
