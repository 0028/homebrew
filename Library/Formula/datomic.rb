require 'formula'

class Datomic < Formula
  homepage 'http://www.datomic.com/'
  url 'https://my.datomic.com/downloads/free/0.9.4699'
  sha1 '119c46bdcfadf1f6aff16e4bf1a4726b7ea0595a'
  version '0.9.4699'

  bottle do
    cellar :any
    sha1 "6bf64708d66fe5e65dff722ad4b09f2039c6938d" => :mavericks
    sha1 "12e43e5bef2307dec82e373df51d9027769795d4" => :mountain_lion
    sha1 "d7438e8010b4a48c5268c3e25a205d6e414e19f7" => :lion
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
