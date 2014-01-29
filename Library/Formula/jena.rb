require 'formula'

class Jena < Formula
  homepage 'http://jena.apache.org/'
  url 'http://www.apache.org/dist/jena/binaries/apache-jena-2.11.1.tar.gz'
  sha1 '1cb7122ed62d8748b8cc759ae22292f9cc4336bf'

  bottle do
    sha1 "ea4c72fa1ad25fa72d8f4e15b97c3b85ab06969a" => :mavericks
    sha1 "b921fe33cf34c2deaf49c8d483d362b502d90364" => :mountain_lion
    sha1 "f8fb1006084dc611f10c53fbfcf2484a444d6de3" => :lion
  end

  def shim_script target
    <<-EOS.undent
      #!/usr/bin/env bash
      export JENA_HOME="#{libexec}"
      "$JENA_HOME/bin/#{target}" "$@"
    EOS
  end

  def install
    # Remove Windows scripts
    rm_rf Dir['bat']

    # Install files
    prefix.install %w{ LICENSE ReleaseNotes-Jena.txt NOTICE ReleaseNotes-TDB.txt README ReleaseNotes-ARQ.txt }
    doc.install ['javadoc-arq', 'javadoc-core', 'javadoc-sdb', 'javadoc-tdb', 'src-examples']
    libexec.install Dir['*']
    Dir["#{libexec}/bin/*"].map { |p| Pathname.new p }.each { |path|
      bin_name = path.basename
      (bin+bin_name).write shim_script(bin_name)
    }
  end
end
