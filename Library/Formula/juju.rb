require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.16/1.16.4/+download/juju-core_1.16.4.tar.gz'
  sha1 '17732fca4a4ec0f27370b0c9c755f3c9d712eaea'

  bottle do
    sha1 '4a9f5761b54f91253f09d1ad8367ab04d11e742c' => :mavericks
    sha1 '668bf9b9992ae67b98948452431e21d9d4dc39df' => :mountain_lion
    sha1 '9ff6cac63681f07a28f71675ff6ccb954eb31962' => :lion
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
