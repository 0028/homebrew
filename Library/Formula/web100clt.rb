require 'formula'

class Web100clt < Formula
  homepage 'http://software.internet2.edu/ndt/'
  url 'http://software.internet2.edu/sources/ndt/ndt-3.6.5.2.tar.gz'
  sha1 '533a7dbb1b660a0148a0e295b481f63ab9ecb8f7'

  def install
    # avoid problem with default default secure strlcpy/strlcat
    # functions in 10.9
    if MacOS.version >= :mavericks
      ENV.append 'CFLAGS', '-D_FORTIFY_SOURCE=0'
    end

    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"

    # we only want to build the web100clt client so we need
    # to change to the src directory before installing.
    cd 'src' do
      system "make CFLAGS=#{ENV.cflags} install"
    end

    cd 'doc' do
      man1.install 'web100clt.man' => 'web100clt.1'
    end
  end

  def test
    system "#{bin}/web100clt", "-v"
  end
end
