require 'formula'

class Riak < Formula
  homepage 'http://basho.com/riak/'
  url 'http://s3.amazonaws.com/downloads.basho.com/riak/1.4/1.4.6/osx/10.8/riak-1.4.6-OSX-x86_64.tar.gz'
  version '1.4.6'
  sha1 '33b6d74f3197c7523e1d1bf3fb2e26178e003c6f'

  devel do
    url 'http://s3.amazonaws.com/downloads.basho.com/riak/2.0/2.0.0pre5/osx/10.8/riak-2.0.0pre5-OSX-x86_64.tar.gz'
    sha1 '2394a7244329b60afd87307e3362d784a1611689'
    version '2.0.0-pre5'
  end

  depends_on :macos => :mountain_lion
  depends_on :arch => :x86_64

  def install
    libexec.install Dir['*']
    inreplace Dir["#{libexec}/lib/env.sh"] do |s|
      s.change_make_var! "RUNNER_BASE_DIR", prefix/libexec
    end
    bin.write_exec_script libexec/'bin/riak'
    bin.write_exec_script libexec/'bin/riak-admin'
    bin.write_exec_script libexec/'bin/riak-debug'
    bin.write_exec_script libexec/'bin/search-cmd'
  end
end
