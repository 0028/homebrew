require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.16/1.16.6/+download/juju-core_1.16.6.tar.gz'
  sha1 '0483d7a4d3fda0981f822d540cded855eb5afbda'

  bottle do
    sha1 "5bcfa7a39fc3348712f154a7308ea5229c2ade84" => :mavericks
    sha1 "9109dc597f9ddd9793478efb520bc60778a63e6a" => :mountain_lion
    sha1 "201cda5a5ef9c364c176d4aa2547ba5e784ed0d9" => :lion
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

  def test
    system "#{bin}/juju", "version"
  end
end
