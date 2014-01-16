require 'formula'

class Global < Formula
  homepage 'http://www.gnu.org/software/global/'
  url 'http://ftpmirror.gnu.org/global/global-6.2.10.tar.gz'
  mirror 'http://ftp.gnu.org/gnu/global/global-6.2.10.tar.gz'
  sha1 'aeaa31fec3ab693e75f659ff526c15da7c85c0f9'
  head 'cvs://:pserver:anonymous:@cvs.savannah.gnu.org:/sources/global:global'

  if build.head?
    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option 'with-exuberant-ctags', 'Enable Exuberant Ctags as a plug-in parser'

  if build.include? 'with-exuberant-ctags'
    depends_on 'ctags'
    skip_clean 'lib/gtags/exuberant-ctags.la'
  end

  def install
    if build.head?
      system "sh", "reconf.sh"
    end

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]

    if build.include? 'with-exuberant-ctags'
      args << "--with-exuberant-ctags=#{HOMEBREW_PREFIX}/bin/ctags"
    end

    system "./configure", *args
    system "make install"

    # we copy these in already
    cd share/'gtags' do
      rm %w[README COPYING LICENSE INSTALL ChangeLog AUTHORS]
    end
  end
end
