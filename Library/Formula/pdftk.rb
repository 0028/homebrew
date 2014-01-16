require 'formula'

class PkgExtract < CurlDownloadStrategy
  def stage
    safe_system '/usr/bin/xar', '-xf', @tarball_path
    chdir
    safe_system 'mv *.pkg/Payload Payload.gz'
    safe_system 'ls | grep -v Payload | xargs rm -r'
  end
end

class Pdftk < Formula
  homepage 'http://www.pdflabs.com/tools/pdftk-server'
  url 'http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/pdftk_server-2.02-mac_osx-10.6-setup.pkg',
    :using => PkgExtract
  sha1 '93226ecef996d7ad833a773ee15f9b62365fb567'

  bottle do
    cellar :any
    sha1 'd0dae8717f488de81b2dd355cc98de4fe0ede69d' => :mavericks
    sha1 'cff5d387d319a163265d5122519407c8087ad30a' => :mountain_lion
    sha1 '6b051c1f3367835adf7b4f595e42c1fb323cd84a' => :lion
  end

  depends_on :macos => :lion

  def install
    safe_system "pax --insecure -rz -f Payload.gz -s ',./bin,#{bin},' -s ',./man,#{man},' -s ',./lib,#{lib},' -s ',./license_gpl_pdftk,#{prefix}/LICENSE,' -s ',./,#{prefix}/README/,'"
  end

  test do
    system "#{bin}/pdftk --version"
  end
end
