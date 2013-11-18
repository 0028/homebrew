require 'formula'

class Fwknop < Formula
  homepage 'http://www.cipherdyne.org/fwknop/'
  url 'https://github.com/mrash/fwknop/archive/2.5.1-1.tar.gz'
  sha1 '3f6c43b91ab555d7652b81c16bccfc8049eb0f92'

  head 'https://github.com/mrash/fwknop.git'

  bottle do
    sha1 'f1742e3a47b375db4aba60753c3432ca274de2d6' => :mavericks
    sha1 'e906f2a47435774305df5f4ad02749e3dd095a53' => :mountain_lion
    sha1 '7b6e82a7256ec786a4a212cba3d9669f87d59f2a' => :lion
  end

  # needed for running autogen.sh script in GitHub release tarball
  # as well as when building from HEAD
  depends_on :automake
  depends_on :autoconf
  depends_on :libtool

  # needed for gpg support
  depends_on 'gpgme' => :optional

  def install
    system './autogen.sh' if build.head? or !File.exists?('configure')
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/fwknop", "--version"
  end
end
