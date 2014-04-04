require 'formula'

class Pyenv < Formula
  homepage 'https://github.com/yyuu/pyenv'
  url 'https://github.com/yyuu/pyenv/archive/v0.4.0-20140404.tar.gz'
  sha1 '7b9e2cd26ac195d9849b1311a94fbdd0c97c2dc2'

  head 'https://github.com/yyuu/pyenv.git'

  bottle do
    sha1 "dbdab9948eec4c53d3e25c4b0419cde5d8761fc2" => :mavericks
    sha1 "7b8457af81809ea175a96758c1b4e42c92a887b7" => :mountain_lion
    sha1 "fb779636fec0f59c29dac1540e00d8f7e894d3fb" => :lion
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

    rm_f "#{var_lib}/plugins/python-build"
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
