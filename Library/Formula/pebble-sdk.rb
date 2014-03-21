require 'formula'

class PebbleSdk < Formula
  homepage 'https://developer.getpebble.com/2/'
  url 'https://s3.amazonaws.com/assets.getpebble.com/sdk2/PebbleSDK-2.0.2.tar.gz'
  sha1 'c6e2cefb638ebcfffae31c6cc3b175d3e62b3c44'

  depends_on 'freetype' => :recommended
  depends_on :python

  resource 'pillow' do
    url 'https://pypi.python.org/packages/source/P/Pillow/Pillow-2.3.0.zip'
    sha1 '0d3fdaa9a8a40a59a66c6057b9f91a3553db852e'
  end

  resource 'freetype-py' do
    url 'https://pypi.python.org/packages/source/f/freetype-py/freetype-py-1.0.tar.gz'
    sha1 '3830e45ff9e9a96f1e209d786cbd5492f168127a'
  end

  resource 'sh' do
    url 'https://pypi.python.org/packages/source/s/sh/sh-1.08.tar.gz'
    sha1 '85ca7f0fd69af238cdca94aa3a87f050ad7b11e9'
  end

  resource 'twisted' do
    url 'https://pypi.python.org/packages/source/T/Twisted/Twisted-12.0.0.tar.bz2'
    sha1 '64b7f7fdeefbd4dd8e6bdffb12d9095106ee3d5d'
  end

  resource 'autobahn' do
    url 'https://pypi.python.org/packages/source/a/autobahn/autobahn-0.5.14.zip'
    sha1 '475ba5f281bdcc50858c6920c034a1a067b2ce2a'
  end

  resource 'websocket-client' do
    url 'https://pypi.python.org/packages/source/w/websocket-client/websocket-client-0.12.0.tar.gz'
    sha1 '2c132d1a185ea55bfccde734507158fefc336f91'
  end

  resource 'pyserial' do
    url 'https://pypi.python.org/packages/source/p/pyserial/pyserial-2.6.tar.gz'
    sha1 '39e6d9a37b826c48eab6959591a174135fc2873c'
  end

  resource 'pypng' do
    url 'https://pypi.python.org/packages/source/p/pypng/pypng-0.0.16.tar.gz'
    sha1 'f90a1f88a7875f019b1fc0addde5410ce6daf2dd'
  end

  resource 'pebble-arm-toolchain' do
    url 'http://assets.getpebble.com.s3-website-us-east-1.amazonaws.com/sdk/arm-cs-tools-macos-universal-static.tar.gz'
    sha1 'b1baaf455140d3c6e3a889217bb83986fe6527a0'
  end

  def install
    # This replacement fixes a path that gets messed up because of the
    # bin.env_script_all_files call (which relocates actual pebble.py script
    # to libexec/, causing problems with the absolute path expected below).
    # Also, remove the dependency from virtualenv
    inreplace 'bin/pebble' do |s|
      s.gsub! /^script_path = .*?$/m, "script_path = '#{libexec}/../tools/pebble.py'"

      s.gsub! /^local_python_env.*?=.*?\(.*?\)$/m, ""
      s.gsub! /^process = subprocess\.Popen\(args, shell=False, env=local_python_env\)/, "process = subprocess.Popen(args, shell=False)"
    end

    ENV.append_to_cflags '-Qunused-arguments'
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    resource('pillow').stage { system "python", *install_args }
    resource('freetype-py').stage { system "python", *install_args }
    resource('sh').stage { system "python", *install_args }
    resource('twisted').stage { system "python", *install_args }
    resource('autobahn').stage { system "python", *install_args }
    resource('websocket-client').stage { system "python", *install_args }
    resource('pyserial').stage { system "python", *install_args }
    resource('pypng').stage { system "python", *install_args }

    prefix.install %w[Documentation Examples Pebble PebbleKit-Android
        PebbleKit-iOS bin tools requirements.txt version.txt]

    resource('pebble-arm-toolchain').stage "#{prefix}/arm-cs-tools"

    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system 'pebble', 'new-project', 'test'
    cd 'test' do
      # We have to remove the default /usr/local/include from the CPATH
      # because the toolchain has -Werror=poison-system-directories set
      ENV['CPATH'] = ''
      system 'pebble', 'build'
    end
  end
end

