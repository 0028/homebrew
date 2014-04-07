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
    sha1 "3a156908998c6c8588e4f50d125fa1cfe8a1eba7"
  end

  bottle do
    cellar :any
    revision 1
    sha1 "73e94b61a9043544baffddab6afa686b7d8bb9d9" => :mavericks
    sha1 "ea4425d37f34aed9bc7102472ef8ea31562cc39b" => :mountain_lion
    sha1 "fc9a0bf0f8ddc80378235f20f964a9e5fb78605f" => :lion
  end

  depends_on 'yasm' => :build

  option '10-bit', 'Build a 10-bit x264 (default: 8-bit)'
  option "with-mp4=", "Select mp4 output: none (default), l-smash or gpac"

  case ARGV.value "with-mp4"
  when "l-smash" then depends_on "l-smash"
  when "gpac" then depends_on "gpac"
  end

  def install
    args = %W[
      --prefix=#{prefix}
      --enable-shared
      --enable-static
      --enable-strip
    ]
    if Formula["l-smash"].installed?
      args << "--disable-gpac"
    elsif Formula["gpac"].installed?
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
