require 'formula'

class Ganglia < Formula
  homepage 'http://ganglia.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/ganglia/ganglia%20monitoring%20core/3.6.0/ganglia-3.6.0.tar.gz'
  sha1 'b06529ac49deb1f1c65c6215b8d2d13c3f3fa23f'

  conflicts_with 'coreutils', :because => 'both install `gstat` binaries'

  depends_on 'pkg-config' => :build # to find APR
  depends_on 'confuse'
  depends_on 'pcre'
  depends_on 'rrdtool'

  # fixes build on Leopard and newer, which lack kvm.h and its corresponding /dev/ node
  patch :p0 do
    url "https://gist.githubusercontent.com/bcbcarl/9996346/raw/e71120d3260a1ffdb3dfede411b21a6031ea647a/patch-libmetrics-darwin-metrics.c.diff"
    sha1 "588c42106293e01392b002228d3f342a7ea6b0aa"
  end

  def install
    # ENV var needed to confirm putting the config in the prefix until 3.2
    ENV['GANGLIA_ACK_SYSCONFDIR'] = '1'

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sbindir=#{bin}",
                          "--sysconfdir=#{etc}",
                          "--with-gmetad",
                          "--with-libpcre=#{HOMEBREW_PREFIX}"
    system "make install"

    # Generate the default config file
    system "#{bin}/gmond -t > #{etc}/gmond.conf" unless File.exist? "#{etc}/gmond.conf"

    # Install man pages
    man1.install Dir['mans/*']
  end

  def caveats; <<-EOS.undent
    If you didn't have a default config file, one was created here:
      #{etc}/gmond.conf
    EOS
  end
end
