require 'formula'

class Sbcl < Formula
  homepage 'http://www.sbcl.org/'
  url 'http://downloads.sourceforge.net/project/sbcl/sbcl/1.1.15/sbcl-1.1.15-source.tar.bz2'
  sha1 '345b505353c3ed6a2b2a18e3de9e704527bf32a4'

  head 'git://sbcl.git.sourceforge.net/gitroot/sbcl/sbcl.git'

  bottle do
    revision 1
    sha1 "295ef41a57822642a5f4f94aaac44484687cb07a" => :mavericks
    sha1 "37ea1c8e7378603b6dae987722ccd0d162f67673" => :mountain_lion
    sha1 "47ff7841184f2f9c9dba8559d7129820759b033a" => :lion
  end

  fails_with :llvm do
    build 2334
    cause "Compilation fails with LLVM."
  end

  option "32-bit"
  option "without-threads", "Build SBCL without support for native threads"
  option "with-ldb", "Include low-level debugger in the build"
  option "with-internal-xref", "Include XREF information for SBCL internals (increases core size by 5-6MB)"

  # Current binary versions are listed at http://sbcl.sourceforge.net/platform-table.html

  resource 'bootstrap64' do
    url 'http://downloads.sourceforge.net/project/sbcl/sbcl/1.1.8/sbcl-1.1.8-x86-64-darwin-binary.tar.bz2'
    sha1 'cffd8c568588f48bd0c69295a385b662d27983cf'
  end

  resource 'bootstrap32' do
    url 'http://downloads.sourceforge.net/project/sbcl/sbcl/1.1.6/sbcl-1.1.6-x86-darwin-binary.tar.bz2'
    sha1 '35a76b93f8714bc34ba127df4aaf69aacfc08164'
  end

  def patches
    { :p0 => [
        "https://trac.macports.org/export/88830/trunk/dports/lang/sbcl/files/patch-base-target-features.diff",
        "https://trac.macports.org/export/88830/trunk/dports/lang/sbcl/files/patch-make-doc.diff",
        "https://trac.macports.org/export/88830/trunk/dports/lang/sbcl/files/patch-posix-tests.diff",
        "https://trac.macports.org/export/88830/trunk/dports/lang/sbcl/files/patch-use-mach-exception-handler.diff"
    ]}
  end

  def write_features
    features = []
    features << ":sb-thread" unless build.include? "without-threads"
    features << ":sb-ldb" if build.include? "with-ldb"
    features << ":sb-xref-for-internals" if build.include? "with-internal-xref"

    File.open("customize-target-features.lisp", "w") do |file|
      file.puts "(lambda (list)"
      features.each do |f|
        file.puts "  (pushnew #{f} list)"
      end
      file.puts "  list)"
    end
  end

  def install
    write_features

    # Remove non-ASCII values from environment as they cause build failures
    # More information: http://bugs.gentoo.org/show_bug.cgi?id=174702
    ENV.delete_if do |key, value|
      value =~ /[\x80-\xff]/n
    end

    bootstrap = (build.build_32_bit? || !MacOS.prefer_64_bit?) ? 'bootstrap32' : 'bootstrap64'
    resource(bootstrap).stage do
      # We only need the binaries for bootstrapping, so don't install anything:
      command = Dir.pwd + "/src/runtime/sbcl"
      core = Dir.pwd + "/output/sbcl.core"
      xc_cmdline = "#{command} --core #{core} --disable-debugger --no-userinit --no-sysinit"

      cd buildpath do
        ENV['SBCL_ARCH'] = 'x86' if build.build_32_bit?
        system "./make.sh", "--prefix=#{prefix}", "--xc-host=#{xc_cmdline}"
      end
    end

    ENV['INSTALL_ROOT'] = prefix
    system "sh install.sh"
  end

  test do
    system "#{bin}/sbcl", "--version"
  end
end
