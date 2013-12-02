require 'formula'

class Juju < Formula
  homepage 'https://juju.ubuntu.com'
  url 'https://launchpad.net/juju-core/1.16/1.16.3/+download/juju-core_1.16.3.tar.gz'
  sha1 '986ae55f58ce1838c20eea556a0afc23aff9cdd4'

  bottle do
    sha1 '4b36e7247309864bfd2167653f5dbb0b85f0dc34' => :mavericks
    sha1 'e1fd9ea191489cc2aac7efd8c355002ff4c97baf' => :mountain_lion
    sha1 'f091f8c0cf069fd1db02fa5cc591ee5bab21f7d9' => :lion
  end

  depends_on 'go' => :build

  fails_with :clang do
    cause "clang: error: no such file or directory: 'libgcc.a'"
  end

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
