require 'formula'

class Nsd < Formula
  homepage 'http://www.nlnetlabs.nl/projects/nsd/'
  url 'http://www.nlnetlabs.nl/downloads/nsd/nsd-4.0.1.tar.gz'
  sha1 '788cc290ade7fc6a61fe4391837d3abddbda4df0'

  bottle do
    sha1 "2666dee18fd2635625d27703e1370e3898686a85" => :mavericks
    sha1 "b18f97bb915d731b04d4179502acaa5d9246215b" => :mountain_lion
    sha1 "e56f19c730db0ca031d478bcd557d027487d9958" => :lion
  end

  option 'with-root-server', 'Allow NSD to run as a root name server'
  option 'with-bind8-stats', 'Enable BIND8-like NSTATS & XSTATS'
  option 'with-ratelimit', 'Enable rate limiting'

  depends_on 'libevent'

  def install
    args = %W[
      --prefix=#{prefix}
      --with-libevent=#{HOMEBREW_PREFIX}
    ]

    args << '--enable-root-server' if build.with? 'root-server'
    args << '--enable-bind8-stats' if build.with? 'bind8-stats'
    args << '--enable-ratelimit' if build.with? 'ratelimit'

    system "./configure", *args
    system "make install"
  end
end
