require 'formula'

class Scons < Formula
  homepage 'http://www.scons.org'
  url 'https://downloads.sourceforge.net/scons/scons-2.3.1.tar.gz'
  sha1 '775e715e49fe5fd8e1d29551a296fdc9267509e7'

  bottle do
    cellar :any
    revision 3
    sha1 "3071ef02f609ddc39dcd4ed72b43ca1cbfaee3e7" => :mavericks
    sha1 "f83be55b809df47e1eb86b3078930c0149d873d6" => :mountain_lion
    sha1 "b37f3e8cd94b8228380cce87833322c8111bd076" => :lion
  end

  def install
    bin.mkpath # Script won't create this if it doesn't already exist
    man1.install gzip('scons-time.1', 'scons.1', 'sconsign.1')
    system "/usr/bin/python", "setup.py", "install",
             "--prefix=#{prefix}",
             "--standalone-lib",
             # SCons gets handsy with sys.path---`scons-local` is one place it
             # will look when all is said and done.
             "--install-lib=#{libexec}/scons-local",
             "--install-scripts=#{bin}",
             "--install-data=#{libexec}",
             "--no-version-script", "--no-install-man"

    # Re-root scripts to libexec so they can import SCons and symlink back into
    # bin. Similar tactics are used in the duplicity formula.
    bin.children.each do |p|
      mv p, "#{libexec}/#{p.basename}.py"
      bin.install_symlink "#{libexec}/#{p.basename}.py" => p.basename
    end
  end
end
