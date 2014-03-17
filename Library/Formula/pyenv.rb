require 'formula'

class Pyenv < Formula
  homepage 'https://github.com/yyuu/pyenv'
  url 'https://github.com/yyuu/pyenv/archive/v0.4.0-20140317.tar.gz'
  sha1 '70ef9a1528ef497f4500ae3ab225ceec5322ebb6'

  head 'https://github.com/yyuu/pyenv.git'

  bottle do
    cellar :any
    sha1 "90d315af6bc8ff14f0b61b82f8aca42d6195f9ba" => :mavericks
    sha1 "e962e8bf65635e39a876b6a10a1a3af74ff25176" => :mountain_lion
    sha1 "83d74670e9a0f481f8936515c2d188a81df05c6d" => :lion
  end

  depends_on 'autoconf' => [:recommended, :run]
  depends_on 'pkg-config' => [:recommended, :run]

  def install
    inreplace 'libexec/pyenv', '/usr/local', HOMEBREW_PREFIX
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
