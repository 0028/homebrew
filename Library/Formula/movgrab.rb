require 'formula'

class Movgrab < Formula
  homepage 'https://sites.google.com/site/columscode/home/movgrab'
  url 'https://sites.google.com/site/columscode/files/movgrab-1.2.1.tar.gz'
  sha1 'f5f2f115dfdc2bb3d637f12d6b311910826e2123'

  bottle do
    cellar :any
    sha1 "6551b10919c65f4641fecb83e4738c5f6740a434" => :mavericks
    sha1 "f3fe1118b4896246636880252ca88eee76e7e090" => :mountain_lion
    sha1 "af2237dda7e319174ebade4a8e09680afe4ad1d0" => :lion
  end

  def install
    system './configure', "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system 'make'

    # because case-insensitivity is sadly a thing and while the movgrab
    # Makefile itself doesn't declare INSTALL as a phony target, we
    # just remove the INSTALL instructions file so we can actually
    # just make install
    system 'rm INSTALL'
    system 'make install'
  end
end
