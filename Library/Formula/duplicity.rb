require 'formula'

class Duplicity < Formula
  homepage 'http://www.nongnu.org/duplicity/'
  url 'http://code.launchpad.net/duplicity/0.6-series/0.6.23/+download/duplicity-0.6.23.tar.gz'
  sha1 '0b8664d55c24957b3b19e903c0d69673f2bfa166'

  bottle do
    cellar :any
    sha1 "1753ac0a9f3e148416ba95cbea62bd3bf1bf30cb" => :mavericks
    sha1 "c18facae71e2dcfe9aeb5b1afde2db5936c3e5f9" => :mountain_lion
    sha1 "1d839511700f987c9ece3ed14110be35ffcfc859" => :lion
  end

  depends_on :python
  depends_on 'librsync'
  depends_on 'gnupg'

  option :universal

  resource 'lockfile' do
    url 'https://pypi.python.org/packages/source/l/lockfile/lockfile-0.9.1.tar.gz'
    sha1 '9870cc7e7d4b23f0b6c39cf6ba597c87871ac6de'
  end

  resource 'paramiko' do
    url 'https://pypi.python.org/packages/source/p/paramiko/paramiko-1.12.1.tar.gz'
    sha1 '3809737533b3055b9822a86bee6bd1629144204d'
  end

  def install
    ENV.universal_binary if build.universal?
    ENV.refurbish_args

    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]
    resource('lockfile').stage { system "python", *install_args }
    resource('paramiko').stage { system "python", *install_args }

    system "python", "setup.py", "install", "--prefix=#{prefix}"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "duplicity", "--version"
  end
end
