require 'formula'

class Pyenv < Formula
  homepage 'https://github.com/yyuu/pyenv'
  url 'https://github.com/yyuu/pyenv/archive/v0.4.0-20140211.tar.gz'
  sha1 'f7c8a5baa9a6f857344935bec3f280a5fe1c6408'

  head 'https://github.com/yyuu/pyenv.git'

  bottle do
    cellar :any
    sha1 "072e683802ea9ec96ebe5667e09883516513ada3" => :mavericks
    sha1 "a28b4a9a2866d3c69d4bb8f56b423b5913be96f0" => :mountain_lion
    sha1 "13aece736eb2631fc44a862a43ce3fe4f7bcc605" => :lion
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
