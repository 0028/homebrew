require 'formula'

class Drake < Formula
  # TODO? detect version
  VERSION = '0.1.5-SNAPSHOT'

  homepage 'https://github.com/Factual/drake'
  # no tags yet, this is latest rev of default branch 'develop'
  url 'https://api.github.com/repos/Factual/drake/tarball/97c4ffa193a13f990ce11c5f724ec2049a67a624'
  sha1 '82acf3986f73395fa266610ce9311208e8cf8302'
  version VERSION

  depends_on 'leiningen' => :build
  depends_on 'drip' => :optional

  def build_from_source
    system 'lein uberjar'
    'target/drake.jar'
  end

  def install_binary(filename, version)
    installjar = "drake-#{version}.jar"
    File.rename filename, installjar
    libexec.install installjar
    installjar
  end

  # custom jar script
  def write_bin_script(targetjar, script_name)
    (bin+script_name).write <<-EOS.undent
      #!/bin/bash
      cmd='java'
      # use drip if available
      if [[ -x `which drip` ]]; then
        cmd='drip'
      fi
      exec ${cmd} -jar #{libexec}/drake-#{self.version}.jar "$@"
    EOS
  end

  def install
    uberjar = self.build_from_source
    installjar = self.install_binary uberjar, VERSION
    self.write_bin_script installjar, 'drake'
  end

  test do
    system bin/'drake', '--version'
  end
end
