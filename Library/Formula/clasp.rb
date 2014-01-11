require 'formula'

class Clasp < Formula
  homepage 'http://potassco.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/potassco/clasp/2.1.4/clasp-2.1.4-source.tar.gz'
  sha1 '4c6ec3ee2f68fd5f9b3574ebb5a8b069d65d12df'

  bottle do
    cellar :any
    sha1 '5bf5b3a7771b62dd07802fd7d9d33f7450571f58' => :mavericks
    sha1 'd5501eb06a88b905ddc189983595010681751ad6' => :mountain_lion
    sha1 'a728fd4b8ad682335774f0193528b9d987029516' => :lion
  end

  option 'with-mt', 'Enable multi-thread support'

  depends_on 'tbb' if build.include? 'with-mt'

  def install
    if build.include? 'with-mt'
      ENV['TBB30_INSTALL_DIR'] = Formula.factory("tbb").opt_prefix
      build_dir = 'build/release_mt'
    else
      build_dir = 'build/release'
    end

    args = %W[
      --config=release
      --prefix=#{prefix}
    ]
    args << "--with-mt" if build.include? 'with-mt'

    bin.mkpath
    system "./configure.sh", *args

    cd build_dir do
      system "make install"
    end
  end
end
