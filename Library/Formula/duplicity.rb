require 'formula'

class Duplicity < Formula
  homepage 'http://www.nongnu.org/duplicity/'
  url 'http://code.launchpad.net/duplicity/0.6-series/0.6.23/+download/duplicity-0.6.23.tar.gz'
  sha1 '0b8664d55c24957b3b19e903c0d69673f2bfa166'

  bottle do
    sha1 "dbad7e81934b68e6ef33045fc422d9159878b91e" => :mavericks
    sha1 "e96bb21c09f672f7932be50e190121095d8cb2ae" => :mountain_lion
    sha1 "aa0a964b06bf9d260f20758104febf3a697eebcc" => :lion
  end

  depends_on :python
  depends_on 'librsync'
  depends_on 'gnupg'

  option :universal

  resource 'lockfile' do
    url 'https://pypi.python.org/packages/source/l/lockfile/lockfile-0.9.1.tar.gz'
    sha1 '9870cc7e7d4b23f0b6c39cf6ba597c87871ac6de'
  end

  def install
    ENV.universal_binary if build.universal?

    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]
    resource('lockfile').stage { system "python", *install_args }

    system "python", "setup.py", "install", "--prefix=#{prefix}"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "duplicity", "--version"
  end
end
