require 'formula'

class Datomic < Formula
  homepage 'http://www.datomic.com/'
  url 'https://my.datomic.com/downloads/free/0.9.4699'
  sha1 '119c46bdcfadf1f6aff16e4bf1a4726b7ea0595a'
  version '0.9.4699'

  bottle do
    cellar :any
    sha1 "67941590180c3eaf502b136ad41c7ae652e8c79f" => :mavericks
    sha1 "3fc67e8511f41e6428a426a61d924396c18ab985" => :mountain_lion
    sha1 "4b23bee0c64cad7ea2299ef54c2817ec9bf58f65" => :lion
  end

  def write_libexec_alias *script_names
    script_names.each do |script_name|
      alias_name = script_name == 'datomic' ? 'datomic' : "datomic-#{script_name}"
      (bin + alias_name).write <<-EOS.undent
        #!/bin/bash
        cd #{libexec} && exec "bin/#{script_name}" "$@"
      EOS
    end
  end

  def install
    libexec.install Dir['*']
    write_libexec_alias 'datomic', 'transactor', 'repl', 'repl-jline', 'rest', 'shell'
  end

  def caveats
    <<-EOS.undent
      You may need to set JAVA_HOME:
        export JAVA_HOME="$(/usr/libexec/java_home)"
      All commands have been installed with the prefix 'datomic-'.

      We agreed to the Datomic Free Edition License for you:
        http://www.datomic.com/datomic-free-edition-license.html
      If this is unacceptable you should uninstall.
    EOS
  end
end
