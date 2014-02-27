require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.16/1.16.6/+download/juju-core_1.16.6.tar.gz'
  sha1 '0483d7a4d3fda0981f822d540cded855eb5afbda'

  bottle do
    sha1 "79d508f3c7ab22c4ed597baf2e12f7e318b3c3f3" => :mavericks
    sha1 "c22acc1b554fdabef1f8a70f674d540aa33bb7b9" => :mountain_lion
    sha1 "3e25bea63f01d6181fbb7c5ef423822eb5ee1ce8" => :lion
  end

  devel do
    url  'https://launchpad.net/juju-core/trunk/1.17.3/+download/juju-core_1.17.3.tar.gz'
    sha1 'a4579476a6fb83722da869228b887c39e8ec8c7e'
  end

  depends_on 'go' => :build

  def install
    ENV['GOPATH'] = buildpath
    args = %w(install launchpad.net/juju-core/cmd/juju)
    args.insert(1, "-v") if ARGV.verbose?
    system "go", *args
    bin.install 'bin/juju'
    (bash_completion/'juju-completion.bash').write <<-EOS.undent
    _juju()
    {
        local cur prev options files targets
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        prev="${COMP_WORDS[COMP_CWORD-1]}"
        actions=$(juju help commands 2>/dev/null | awk '{print $1}')
        COMPREPLY=( $( compgen -W "${actions}" -- ${cur} ) )
        return 0
    }
    complete -F _juju juju
    EOS
  end

  test do
    system "#{bin}/juju", "version"
  end
end
