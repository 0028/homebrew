require 'formula'

class PostgresqlJdbc3 < Formula
  homepage 'http://jdbc.postgresql.org/about/about.html'
  url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc3.jar'
  sha1 '682c1724724a2fbbd338ba9336686696558e2a5f'
  version '9.3-1100'

  bottle do
    cellar :any
    sha1 '2def987574fe32ad83d27aa2393b8172718c54de' => :mavericks
    sha1 '6a715cbec5738db11009db1fbc622ca90de940b9' => :mountain_lion
    sha1 '695f18ce61d9d9011fa9630a02b458374649ad43' => :lion
  end

  def install
    libexec.install Dir['*.jar']
  end
end
