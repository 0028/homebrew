require 'formula'

class PostgresqlJdbc41 < Formula
  homepage 'http://jdbc.postgresql.org/about/about.html'
  url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc41.jar'
  sha1 '8f89bd15ef7b9a7db03b13a0d69ace8581916160'
  version '9.3-1100'

  bottle do
    cellar :any
    sha1 'b84d6290d82714b64f03f4fb9f7449dc5733aef4' => :mavericks
    sha1 'df969a12023908ad81b7bcd6a061ee68b28ae887' => :mountain_lion
    sha1 '944bcdd0f9e0c79fc1f22ea1544fabed3e08571d' => :lion
  end

  def install
    libexec.install Dir['*.jar']
  end
end
