require 'formula'

class Global < Formula
  homepage 'http://www.gnu.org/software/global/'
  url 'http://ftpmirror.gnu.org/global/global-6.2.10.tar.gz'
  bottle do
    sha1 "1ef174b61a46628792a52044402af111233d1c14" => :mavericks
    sha1 "7ab46a39460ebe0168af6bdf6abac14fdabc4a11" => :mountain_lion
    sha1 "0d2d82885f3938a17fb372d186e9336d144d4bf6" => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/global/global-6.2.10.tar.gz'
  sha1 'aeaa31fec3ab693e75f659ff526c15da7c85c0f9'

  head do
    url 'cvs://:pserver:anonymous:@cvs.savannah.gnu.org:/sources/global:global'

    depends_on :autoconf
    depends_on :automake
    depends_on :libtool
  end

  option 'with-exuberant-ctags', 'Enable Exuberant Ctags as a plug-in parser'

  if build.with? 'exuberant-ctags'
    depends_on 'ctags'
    skip_clean 'lib/gtags/exuberant-ctags.la'
  end

  def install
    system "sh", "reconf.sh" if build.head?

    args = %W[
      --disable-dependency-tracking
      --prefix=#{prefix}
      --sysconfdir=#{etc}
    ]

    if build.with? 'exuberant-ctags'
      args << "--with-exuberant-ctags=#{HOMEBREW_PREFIX}/bin/ctags"
    end

    system "./configure", *args
    system "make install"

    etc.install 'gtags.conf'

    # we copy these in already
    cd share/'gtags' do
      rm %w[README COPYING LICENSE INSTALL ChangeLog AUTHORS]
    end
  end
end
