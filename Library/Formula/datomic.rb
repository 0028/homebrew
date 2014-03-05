require 'formula'

class Datomic < Formula
  homepage 'http://www.datomic.com/'
  url 'https://my.datomic.com/downloads/free/0.9.4578'
  sha1 '98be5ed1c419993beba09bd67c412c6ac6678d72'
  version '0.9.4578'

  bottle do
    cellar :any
    sha1 "5236f3a58c8096f19237217479956ea0a4ef7b90" => :mavericks
    sha1 "94bd09aa3aeae6bc1d3cd04d266f047b3693858e" => :mountain_lion
    sha1 "74bd4314e1dffe6f3bec5ecf459a2b67684293f3" => :lion
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
