require 'formula'

class Irods < Formula
  homepage 'https://www.irods.org'
  url 'https://github.com/irods/irods-legacy/archive/3.3.tar.gz'
  sha1 '2e975fcda20b023155dfd53ff098dde0c3995f75'

  bottle do
    cellar :any
    sha1 "0431996f00e05c8ebc1a998551680f84218c71ef" => :mavericks
    sha1 "4b754d49c66cba681ac148ca64aaf17345b2edf3" => :mountain_lion
    sha1 "e5e191c170f6f46654232009292139dfb9a0e024" => :lion
  end

  conflicts_with 'sleuthkit', :because => 'both install `ils`'

  option 'with-fuse', 'Install iRODS FUSE client'

  depends_on 'osxfuse' if build.include? 'with-fuse'

  def install
    chdir 'iRODS'
    system './scripts/configure'

    # include PAM authentication by default
    inreplace 'config/config.mk', '# PAM_AUTH = 1', 'PAM_AUTH = 1'
    inreplace 'config/config.mk', '# USE_SSL = 1', 'USE_SSL = 1'

    system 'make'

    bin.install Dir['clients/icommands/bin/*'].select {|f| File.executable? f}

    # patch in order to use fuse4x
    if build.include? 'with-fuse'
      inreplace 'config/config.mk', '# IRODS_FS = 1', 'IRODS_FS = 1'
      inreplace 'config/config.mk', 'fuseHomeDir=/home/mwan/adil/fuse-2.7.0', "fuseHomeDir=#{HOMEBREW_PREFIX}"
      chdir 'clients/fuse' do
        inreplace 'Makefile', 'lfuse', 'losxfuse'
        inreplace 'Makefile', '-I$(fuseHomeDir)/include', '-I$(fuseHomeDir)/include/osxfuse'
        system 'make'
      end
      bin.install Dir['clients/fuse/bin/*'].select {|f| File.executable? f}
    end
  end

  def test
    system "#{bin}/ipwd"
  end
end
