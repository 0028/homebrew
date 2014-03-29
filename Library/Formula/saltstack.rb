require 'formula'

# We use a custom download strategy to properly configure
# salt's version information when built against HEAD.
# This is populated from git information unfortunately.
class SaltHeadDownloadStrategy < GitDownloadStrategy
  def stage
    @clone.cd {reset}
    safe_system 'git', 'clone', @clone, '.'
  end
end

class Saltstack < Formula
  homepage 'http://www.saltstack.org'
  url 'https://github.com/saltstack/salt/archive/v2014.1.1.tar.gz'
  sha1 '7bccfe266aa319646edacaff003a6df5a3863611'

  bottle do
    sha1 "2d36dfdfd2778ac2b6b3e02937bc32f7cf9fd598" => :mavericks
    sha1 "6b9d4df74213581c5bb1c8720483c5e2b22c14aa" => :mountain_lion
    sha1 "e25233eacd30020384b737c3ce936f0b94957fe0" => :lion
  end

  head 'https://github.com/saltstack/salt.git', :branch => 'develop',
    :using => SaltHeadDownloadStrategy, :shallow => false

  depends_on :python
  depends_on 'swig' => :build
  depends_on 'zeromq'
  depends_on 'libyaml'

  resource 'pycrypto' do
    url 'https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.tar.gz'
    sha1 'c17e41a80b3fbf2ee4e8f2d8bb9e28c5d08bbb84'
  end

  resource 'm2crypto' do
    url 'https://pypi.python.org/packages/source/M/M2Crypto/M2Crypto-0.22.3.tar.gz'
    sha1 'c5e39d928aff7a47e6d82624210a7a31b8220a50'
  end

  resource 'pyyaml' do
    url 'https://pypi.python.org/packages/source/P/PyYAML/PyYAML-3.10.tar.gz'
    sha1 '476dcfbcc6f4ebf3c06186229e8e2bd7d7b20e73'
  end

  resource 'markupsafe' do
    url 'https://pypi.python.org/packages/source/M/MarkupSafe/MarkupSafe-0.18.tar.gz'
    sha1 '9fe11891773f922a8b92e83c8f48edeb2f68631e'
  end

  resource 'jinja2' do
    url 'https://pypi.python.org/packages/source/J/Jinja2/Jinja2-2.7.2.tar.gz'
    sha1 '1ce4c8bc722444ec3e77ef9db76faebbd17a40d8'
  end

  resource 'pyzmq' do
    url 'https://pypi.python.org/packages/source/p/pyzmq/pyzmq-14.0.1.tar.gz'
    sha1 'd09c72dc6dcad9449dbcb2f97b3cc1f2443d4b84'
  end

  resource 'msgpack-python' do
    url 'https://pypi.python.org/packages/source/m/msgpack-python/msgpack-python-0.4.1.tar.gz'
    sha1 'ae7b4d1afab10cd78baada026cad1ae92354852b'
  end

  resource 'apache-libcloud' do
    url 'https://pypi.python.org/packages/source/a/apache-libcloud/apache-libcloud-0.14.1.tar.gz'
    sha1 'e587c9c3519e7d061f3c2fb232af8ace593c8156'
  end

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('pycrypto').stage { system "python", *install_args }
    resource('pyyaml').stage { system "python", *install_args }
    resource('pyzmq').stage { system "python", *install_args }
    resource('msgpack-python').stage { system "python", *install_args }
    resource('markupsafe').stage { system "python", *install_args }
    resource('m2crypto').stage { system "python", *install_args }
    resource('jinja2').stage { system "python", *install_args }
    resource('apache-libcloud').stage { system "python", *install_args }

    system "python", "setup.py", "install", "--prefix=#{prefix}"

    man1.install Dir['doc/man/*.1']
    man7.install Dir['doc/man/*.7']

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "#{bin}/salt", "--version"
  end
end
