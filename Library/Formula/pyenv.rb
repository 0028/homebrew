require 'formula'

class Pyenv < Formula
  homepage 'https://github.com/yyuu/pyenv'
  url 'https://github.com/yyuu/pyenv/archive/v0.4.0-20131116.tar.gz'
  sha1 'edbe76ffc1e9b2fc180c1beaffd294946eae7917'

  head 'https://github.com/yyuu/pyenv.git'

  bottle do
    cellar :any
    sha1 'b76fdffa50de27608f0ab244d17f4e29f8a9096e' => :mavericks
    sha1 '8559e089010ea5a6e976bd78ba3202b17db22692' => :mountain_lion
    sha1 '479c8f4bb2d1c4671928a99762ce2458f5308a32' => :lion
  end

  skip_clean "plugins", "versions"

  def install
    prefix.install "LICENSE", "README.md", "bin", "completions", "libexec"
    prefix.install "plugins" => "default-plugins"

    var_lib = "#{HOMEBREW_PREFIX}/var/lib/pyenv"
    ['plugins', 'versions'].each do |dir|
      var_dir = "#{var_lib}/#{dir}"
      mkdir_p var_dir
      ln_sf var_dir, "#{prefix}/#{dir}"
    end

    ln_sf "#{prefix}/default-plugins/python-build", "#{var_lib}/plugins/python-build"
    ["pyenv-install", "pyenv-uninstall", "python-build"].each do |cmd|
      bin.install_symlink "#{prefix}/default-plugins/python-build/bin/#{cmd}"
    end
  end

  def caveats; <<-EOS.undent
    To enable shims and autocompletion add to your profile:
      if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

    To use Homebrew's directories rather than ~/.pyenv add to your profile:
      export PYENV_ROOT=#{opt_prefix}
    EOS
  end
end
