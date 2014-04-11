require 'formula'

class Lynis < Formula
  homepage 'http://www.rootkit.nl/projects/lynis.html'
  url 'http://cisofy.com/files/lynis-1.5.0.tar.gz'
  sha1 '082c1ff1cac36af4548d5626d7dc4f0d263f8d11'

  bottle do
    cellar :any
    sha1 "1899d9a39cd8696fc3cdafebbd20f34ee096c503" => :mavericks
    sha1 "a1ea430e384afd096a6a79191863e9054d519afe" => :mountain_lion
    sha1 "1480fe2e99c5b5df27c90a0015030e931f6b2bcc" => :lion
  end

  def install
    inreplace 'lynis' do |s|
      s.gsub! 'tINCLUDE_TARGETS="/usr/local/include/lynis /usr/local/lynis/include /usr/share/lynis/include ./include"', 'tINCLUDE_TARGETS="' + (prefix/'include') + '"'
      s.gsub! 'tPLUGIN_TARGETS="/usr/local/lynis/plugins /usr/local/share/lynis/plugins /usr/share/lynis/plugins /etc/lynis/plugins ./plugins"', 'tPLUGIN_TARGETS="' + (prefix/'plugins') + '"'
      s.gsub! 'tDB_TARGETS="/usr/local/share/lynis/db /usr/local/lynis/db /usr/share/lynis/db ./db"', 'tDB_TARGETS="' + (prefix/'db') + '"'
      s.gsub! 'tPROFILE_TARGETS="/usr/local/etc/lynis/default.prf /etc/lynis/default.prf ./default.prf"', 'tPROFILE_TARGETS="' + (prefix/'default.prf') + '"'
    end

    prefix.install "db", "dev", "include", "plugins", "default.prf"
    bin.install "lynis"
    man8.install "lynis.8"
  end
end
