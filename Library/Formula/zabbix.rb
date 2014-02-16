require 'formula'

class Zabbix < Formula
  homepage 'http://www.zabbix.com/'
  url 'http://downloads.sourceforge.net/project/zabbix/ZABBIX%20Latest%20Stable/2.2.2/zabbix-2.2.2.tar.gz'
  sha1 '0be3f194a9ee6a9354d9f18e17b717289fe35a4f'

  bottle do
    sha1 "3d998529fb535b9e694c581f78a3aaf2301b5723" => :mavericks
    sha1 "36dfddc3522cbea1afbfa35336f4cbdc6949824e" => :mountain_lion
    sha1 "3e3ef24ca5fb4b6f3e1992c8b85e9f7ff5259a7e" => :lion
  end

  option 'with-mysql', 'Use Zabbix Server with MySQL library instead PostgreSQL.'
  option 'agent-only', 'Install only the Zabbix Agent without Server and Proxy.'

  unless build.include? 'agent-only'
    depends_on :mysql => :optional
    depends_on :postgresql unless build.with? 'mysql'
    depends_on 'fping'
    depends_on 'libssh2'
  end

  def brewed_or_shipped(db_config)
    brewed_db_config = "#{HOMEBREW_PREFIX}/bin/#{db_config}"
    (File.exist?(brewed_db_config) && brewed_db_config) || which(db_config)
  end

  def install
    args = %W{
      --disable-dependency-tracking
      --prefix=#{prefix}
      --enable-agent
    }

    unless build.include? 'agent-only'
      args += %W{
        --enable-server
        --enable-proxy
        --enable-ipv6
        --with-net-snmp
        --with-libcurl
        --with-ssh2
      }
      if build.with? 'mysql'
        args << "--with-mysql=#{brewed_or_shipped('mysql_config')}"
      else
        args << "--with-postgresql=#{brewed_or_shipped('pg_config')}"
      end
    end

    system "./configure", *args
    system "make install"

    unless build.include? 'agent-only'
      db = build.with?('mysql') ? 'mysql' : 'postgresql'
      (share/'zabbix').install 'frontends/php', "database/#{db}"
    end
  end

  def test
    system "#{sbin}/zabbix_agentd", "--print"
  end
end
