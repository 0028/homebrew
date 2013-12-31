require 'formula'

class PostgresqlJdbc4 < Formula
  homepage 'http://jdbc.postgresql.org/about/about.html'
  url 'http://jdbc.postgresql.org/download/postgresql-9.3-1100.jdbc4.jar'
  sha1 'fe6ed26ff71d75ebb99e2ec2123003e05ea16dc5'
  version '9.3-1100'

  bottle do
    cellar :any
    sha1 '7b9650cd1b0a987c40c65b6773bcc30f16a01c71' => :mavericks
    sha1 'd8931b3d399d8891f4f23520bcaaee221fb8ab31' => :mountain_lion
    sha1 '3bba3ffaa6c94bcb97e4636740fe9b13bbe7e7d7' => :lion
  end

  def install
    libexec.install Dir['*.jar']
  end
end
