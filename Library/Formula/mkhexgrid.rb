require 'formula'

class Mkhexgrid < Formula
  homepage 'http://www.nomic.net/~uckelman/mkhexgrid/'
  url 'http://www.nomic.net/~uckelman/mkhexgrid/releases/mkhexgrid-0.1.1.src.tar.bz2'
  sha1 '3b8e0be3636f90a3217a5e3556bdaf7bb0c49116'

  bottle do
    cellar :any
    sha1 '485ae124b522ccfe47611f175e35c64a413ed46f' => :mavericks
    sha1 'd428a599216503995ad0b7a52ef490368cd7d1fc' => :mountain_lion
    sha1 'deb897804340254a48f798eb937f7f237a2b7503' => :lion
  end

  depends_on 'boost'
  depends_on 'gd' => %w{with-freetype}

  def install
    inreplace 'Makefile' do |s|
      s.change_make_var! "DESTDIR", prefix
      s.change_make_var! "CC", ENV.cc
      s.gsub! /install (.*) -o 0 -g 0/, 'install \1'
    end
    inreplace 'mkhexgrid.cpp' do |s|
      s.sub! 'catch (exception &e)', 'catch (std::exception &e)'
    end
    system "make" # needs to be separate
    system "make", "install"
  end

  test do
    # test the example from the man page (but without inches)
    system "mkhexgrid", "--output=ps", "--image-width=2448",
    "--image-height=1584", "--hex-side=36", "--coord-bearing=0",
    "--coord-dist=22", "--coord-size=8", "--grid-thickness=1",
    "--coord-font=Helvetica", "--grid-grain=h", "--grid-start=o",
    "--coord-tilt=-90", "--centered", "-o", "test.ps"
  end
end
