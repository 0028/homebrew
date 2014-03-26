require 'formula'

class ClozureCl < Formula
  homepage 'http://ccl.clozure.com/'
  url 'http://ccl.clozure.com/ftp/pub/release/1.9/ccl-1.9-darwinx86.tar.gz'
  version '1.9'
  sha1 '589b94093fc356c458ab288aceb5a3d5d9d7b829'

  bottle do
    cellar :any
    sha1 "59e8fb15fe3753b2174dbbcffce92389c08e85f6" => :mavericks
    sha1 "3486dedf74c7789cca68f485c034b7731f8b30a8" => :mountain_lion
    sha1 "394f5b5b6ebfad22fff90e30f306b9e7d9222946" => :lion
  end

  conflicts_with 'cclive', :because => 'both install a ccl binary'

  def install
    # Get rid of all the .svn directories
    buildpath.find do |path|
      if path.directory? and path.basename.to_s == '.svn'
        rm_rf path
        Find.prune
      end
    end

    libexec.install Dir["*"]
    scripts = Dir["#{libexec}/scripts/ccl{,64}"]

    inreplace scripts do |s|
      s.gsub! /CCL_DEFAULT_DIRECTORY=.+$/, %Q{CCL_DEFAULT_DIRECTORY="#{libexec}"}
    end

    bin.install_symlink scripts
  end

  def test_ccl(bit = 32)
    ccl = bin + "ccl#{'64' if bit == 64}"
    %Q{#{ccl} -e '(progn (format t "Hello world from #{bit}-bit ClozureCL") (ccl::quit))'}
  end

  test do
    system test_ccl
    system test_ccl(64)
  end
end
