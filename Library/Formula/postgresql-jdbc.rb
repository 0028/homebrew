require 'formula'

class PostgresqlJdbc < Formula
  homepage 'http://jdbc.postgresql.org/about/about.html'
  url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc3.jar'
  sha1 '682c1724724a2fbbd338ba9336686696558e2a5f'
  version '9.3-1100'

  bottle do
    cellar :any
    sha1 'a01e7319552cd13c95c1b91741d5af0dbbbf1793' => :mavericks
    sha1 '6f6fa61694c4a8a5d8a57dbda1107e2e02b563da' => :mountain_lion
    sha1 'd5c34a31cb65c8da520853446fca907c53f0a246' => :lion
  end

  resource 'jdbc4' do
    url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc4.jar'
    sha1 'fe6ed26ff71d75ebb99e2ec2123003e05ea16dc5'
  end

  resource 'jdbc41' do
    url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc41.jar'
    sha1 '8f89bd15ef7b9a7db03b13a0d69ace8581916160'
  end

  option "with-jdbc4", "Install JDBC 4 support"
  option "with-jdbc41", "Install JDBC 41 support"

  def install
    if build.include? "with-jdbc4"
      resource('jdbc4').stage do
        libexec.install Dir['*.jar']
      end
    end
    if build.include? "with-jdbc41"
      resource('jdbc41').stage do
        libexec.install Dir['*.jar']
      end
    end
    libexec.install Dir['*.jar']
  end
end
