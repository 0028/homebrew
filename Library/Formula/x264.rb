require 'formula'

class X264 < Formula
  homepage "http://www.videolan.org/developers/x264.html"
  # the latest commit on the stable branch
  url "http://git.videolan.org/git/x264.git", :revision => "aff928d2a2f601072cebecfd1ac5ff768880cf88"
  version "r2397"
  head "http://git.videolan.org/git/x264.git"

  devel do
    # the latest commit on the master branch
    url "http://git.videolan.org/git/x264.git", :revision => "d6b4e63d2ed8d444b77c11b36c1d646ee5549276"
    version "r2409"
  end

  # Support building with Clang 3.4
  # The patch will be merged in the official repository soon.
  patch do
    url "https://github.com/DarkShikari/x264-devel/commit/bc3b27.patch"
    sha1 "6c3d1bc241c64d8df64273df403d43e3116bd567"
  end

  bottle do
    cellar :any
    revision 1
    sha1 "31732028e7eabc5944c48c4dd6fdbcae09dfdd4d" => :mavericks
    sha1 "501d9aec9a2487f62cc238f34556d8288ec0dfb4" => :mountain_lion
    sha1 "eb0353ff09295f0e54fe2d6cb60fe598681f9ad3" => :lion
  end

  depends_on 'yasm' => :build

  option '10-bit', 'Build a 10-bit x264 (default: 8-bit)'
  option "with-mp4", "Built with support of mp4 output [lsmash, gpac]. You can set the option as --with-mp4=lsmash or --with-mp4=gpac."

  case ARGV.value("with-mp4")
  when "lsmash"
    depends_on "l-smash"
  when "gpac"
    depends_on "gpac"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-static
      --enable-strip
    ]
    if Formula["l-smash"].installed? && Formula["gpac"].installed?
      args << "--disable-gpac"
    elsif Formula["l-smash"].installed?
      args << "--disable-gpac"
    else
      args << "--disable-lsmash"
    end
    args << "--bit-depth=10" if build.include? '10-bit'

    # For running version.sh correctly
    buildpath.install_symlink cached_download/".git"

    system "./configure", *args
    system "make", "install"
  end

  def caveats; <<-EOS.undent
    Because libx264 has a rapidly-changing API, formulae that link against
    it should be reinstalled each time you upgrade x264. Examples include:
       avidemux, ffmbc, ffmpeg, gst-plugins-ugly
    EOS
  end
end
