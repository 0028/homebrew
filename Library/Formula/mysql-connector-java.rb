require 'formula'

class MysqlConnectorJava < Formula
  homepage 'http://dev.mysql.com/downloads/connector/j/'
  url 'http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.28.tar.gz'
  sha1 '872257139fbef8eed808e128eb90abc5d6effe5b'

  bottle do
    cellar :any
    sha1 '0ff07b7132dfb36a77195e002a49c94e886cd22c' => :mavericks
    sha1 'a1139a0bc28399ef06f964f4e41eab155ddb6934' => :mountain_lion
    sha1 'b3a2953504c1685f5bf83e5eb5b28e70834d240f' => :lion
  end

  def install
    prefix.install_metafiles
    libexec.install Dir['*.jar']
    doc.install Dir['docs/*']
  end

end
