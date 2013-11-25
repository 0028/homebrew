require 'formula'

class Liblwgeom < Formula
  homepage 'http://postgis.net'
  url 'http://download.osgeo.org/postgis/source/postgis-2.1.1.tar.gz'
  sha1 'eaff009fb22b8824f89e5aa581e8b900c5d8f65b'

  bottle do
    cellar :any
    sha1 '2323e4b680c7ea521d776124e4e359d4fe6b78fc' => :mavericks
    sha1 '19b0a35355857a885a7a9943a733681d0106f3b5' => :mountain_lion
    sha1 '5fb14e0f7cae7c97d1201bbe29fba9a54cc4f269' => :lion
  end

  head do
    url 'http://svn.osgeo.org/postgis/trunk/'
    depends_on 'postgresql' => :build # don't maintain patches for HEAD
  end

  keg_only "Conflicts with PostGIS, which also installs liblwgeom.dylib"

  depends_on :autoconf => :build
  depends_on :automake => :build
  depends_on :libtool => :build
  depends_on 'gpp' => :build

  depends_on 'proj'
  depends_on 'geos'
  depends_on 'json-c'

  def patches
    if build.stable?
      # Strip all the PostgreSQL functions from PostGIS configure.ac, to allow
      # building liblwgeom.dylib without needing PostgreSQL
      # NOTE: this will need to be maintained per postgis version
      "https://gist.github.com/dakcarto/7458788/raw"
    end
  end

  def install
    # See postgis.rb for comments about these settings
    ENV.deparallelize

    args = [
      "--disable-dependency-tracking",
      "--disable-nls",

      "--with-projdir=#{HOMEBREW_PREFIX}",
      "--with-jsondir=#{Formula.factory('json-c').opt_prefix}",

      # Disable extraneous support
      "--without-libiconv-prefix",
      "--without-libintl-prefix",
      "--without-raster", # this ensures gdal is not required
      "--without-topology"
    ]

    args << "--with-pgconfig=#{Formula.factory('postgresql').opt_prefix.realpath}/bin/pg_config" if build.head?

    system './autogen.sh'
    system './configure', *args

    mkdir 'stage'
    cd 'liblwgeom' do
      system 'make', 'install', "DESTDIR=#{buildpath}/stage"
    end

    # NOTE: lib.install Dir['stage/**/lib/*'] fails (symlink is not resolved)
    prefix.install Dir["stage/**/lib"]
    include.install Dir["stage/**/include/*"]
  end
end
