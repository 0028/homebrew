require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.16/1.16.5/+download/juju-core_1.16.5.tar.gz'
  sha1 '2202805d09dffe64d1e07988b9d1b16e02c7bd52'

  bottle do
    sha1 'ca08b864f65df5c950a6809447d15a05109be99f' => :mavericks
    sha1 '15dcb83cf2052c49c712687cfc7c5ca0944729f8' => :mountain_lion
    sha1 '283641f4a147e0c4ec5815ada6326a0505a46f58' => :lion
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
