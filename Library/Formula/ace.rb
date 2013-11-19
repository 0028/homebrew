require 'formula'

class Ace < Formula
  homepage 'http://www.cse.wustl.edu/~schmidt/ACE.html'
  url 'http://download.dre.vanderbilt.edu/previous_versions/ACE-6.2.3.tar.bz2'
  sha1 'd3efe21bc9c26bde826c549332a12be98636b15c'

  bottle do
    sha1 '5662490d2b703a2c22aa6c648dc8eb33a856f940' => :mavericks
    sha1 'be18c632ba98909e538844ffe04cb5606aa1b390' => :mountain_lion
    sha1 '17f7d21fa1aa0609a63e86f48c5f03995eeda88b' => :lion
  end

  def install
    # ACE has two methods of compilation, "traditional" and ./configure.
    # The "traditional" method has consistently given better results
    # for the last 5 years, so although awkward to use on OSX, we use
    # it anyway.

    # Figure out the names of the header and makefile for this version
    # of OSX and link those files to the standard names.
    name = MacOS.cat.to_s.delete '_'
    ln_sf "config-macosx-#{name}.h", "ace/config.h"
    ln_sf "platform_macosx_#{name}.GNU", "include/makeinclude/platform_macros.GNU"

    # Set up the environment the way ACE expects during build.
    ENV['ACE_ROOT'] = buildpath
    ENV['DYLD_LIBRARY_PATH'] = "#{buildpath}/ace:#{buildpath}/lib"

    # Done! We go ahead and build.
    cd "ace" do
      system "make", "-f", "GNUmakefile.ACE",
                           "INSTALL_PREFIX=#{prefix}",
                           "LDFLAGS=",
                           "DESTDIR=",
                           "INST_DIR=/ace",
                           "debug=0",
                           "shared_libs=1",
                           "static_libs=0",
                           "install"
    end
  end
end
