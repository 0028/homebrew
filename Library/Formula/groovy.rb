require 'formula'

class Groovy < Formula
  homepage 'http://groovy.codehaus.org/'
  url 'http://dist.groovy.codehaus.org/distributions/groovy-binary-2.2.0.zip'
  sha1 'e4c80b14fd21b168c1682b26f117e6427f9e712f'

  bottle do
    cellar :any
    sha1 '7ae4555f2a8e3c608e4285add3a699b4f074f399' => :mavericks
    sha1 '35ecfa20b68ad0ac68487116eb8f2a365fb4abb6' => :mountain_lion
    sha1 'dca7cea58c0093ccdcc2e9b0f8399f9a34913a45' => :lion
  end

  devel do
    url 'http://dist.groovy.codehaus.org/distributions/groovy-binary-2.2.0-rc-3.zip'
    sha1 '4db741568aa6ab1ba333f40f4e25aa63653faa76'
    version '2.2.0-rc3'
  end

  option 'invokedynamic', "Install the InvokeDynamic version of Groovy (only works with Java 1.7+)"

  def install
    # Don't need Windows files.
    rm_f Dir["bin/*.bat"]

    if build.include? 'invokedynamic'
      Dir['indy/*.jar'].each do |src_path|
        dst_file = File.basename(src_path, '-indy.jar') + '.jar'
        dst_path = File.join('lib', dst_file)
        mv src_path, dst_path
      end
    end

    prefix.install_metafiles
    libexec.install %w(bin conf lib embeddable)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<-EOS.undent
      You should set the environment variable GROOVY_HOME to
        #{opt_prefix}/libexec
    EOS
  end
end
