require 'formula'

class Ansible < Formula
  homepage 'http://www.ansible.com/home'
  url 'https://github.com/ansible/ansible/archive/v1.5.2.tar.gz'
  sha1 '26353b324c153c06b48b6ccd0e162c994db8687f'

  head 'https://github.com/ansible/ansible.git', :branch => 'devel'

  depends_on :python
  depends_on 'libyaml'

  option 'with-accelerate', "Enable accelerated mode"

  resource 'pycrypto' do
    url 'https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.1.tar.gz'
    sha1 'aeda3ed41caf1766409d4efc689b9ca30ad6aeb2'
  end

  resource 'pyyaml' do
    url 'https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.10.tar.gz'
    sha1 '476dcfbcc6f4ebf3c06186229e8e2bd7d7b20e73'
  end

  resource 'paramiko' do
    url 'https://pypi.python.org/packages/source/p/paramiko/paramiko-1.12.2.tar.gz'
    sha1 '18345edb328de69070e7f7da1ed72c4f21824928'
  end

  resource 'markupsafe' do
    url 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.19.tar.gz'
    sha1 '5b0ef4acfa4af62277135fbafc99d42560434134'
  end

  resource 'jinja2' do
    url 'https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.2.tar.gz'
    sha1 '1ce4c8bc722444ec3e77ef9db76faebbd17a40d8'
  end

  if build.with? 'accelerate'
    resource 'python-keyczar' do
      url 'https://pypi.python.org/packages/source/p/python-keyczar/python-keyczar-0.71c.tar.gz'
      sha1 '0ac1e85e05acac470029d1eaeece5c47d59fcc89'
    end
  end

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('pycrypto').stage { system "python", *install_args }
    resource('pyyaml').stage { system "python", *install_args }
    resource('paramiko').stage { system "python", *install_args }
    resource('markupsafe').stage { system "python", *install_args }
    resource('jinja2').stage { system "python", *install_args }
    if build.with? 'accelerate'
      resource('python-keyczar').stage { system "python", *install_args }
    end

    inreplace 'lib/ansible/constants.py' do |s|
      s.gsub! '/usr/share/ansible', share+'ansible'
      s.gsub! '/etc/ansible', etc+'ansible'
    end

    system "python", "setup.py", "install", "--prefix=#{prefix}"

    man1.install Dir['docs/man/man1/*.1']

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "#{bin}/ansible", "--version"
  end
end
