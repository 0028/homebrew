require 'formula'

class Pngcrush < Formula
  homepage 'http://pmt.sourceforge.net/pngcrush/'
  # Stay at least one version behind and use the old-versions directory,
  # because tarballs are routinely removed and upstream won't change this
  # practice.
  url 'https://downloads.sourceforge.net/project/pmt/pngcrush/old-versions/1.7/1.7.70/pngcrush-1.7.70.tar.gz'
  sha1 '77a6e092ba192b24f4d51014e7a67ecb50f842e9'

  bottle do
    cellar :any
    sha1 "3f54e7bb8bc4aa532f6c3f27e09c25ee9e14386a" => :mavericks
    sha1 "cf7122fff7a3e4f3527ea1a4e4c9c05156d2d39d" => :mountain_lion
    sha1 "970d1c09f76d5d648e1ee8ca9ac996ecab401d13" => :lion
  end

  def install
    # Required to successfully build the bundled zlib 1.2.6
    ENV.append_to_cflags "-DZ_SOLO"
    # Required to enable "-cc" (color counting) option (disabled by default since 1.5.1)
    ENV.append_to_cflags "-DPNGCRUSH_COUNT_COLORS"

    system "make", "CC=#{ENV.cc}",
                   "LD=#{ENV.cc}",
                   "CFLAGS=#{ENV.cflags}",
                   "LDFLAGS=#{ENV.ldflags}"
    bin.install 'pngcrush'
  end
end
