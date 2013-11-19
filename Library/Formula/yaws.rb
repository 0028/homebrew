require 'formula'

class Yaws < Formula
  homepage 'http://yaws.hyber.org'
  url 'https://github.com/klacke/yaws/archive/yaws-1.98.tar.gz'
  sha1 'a4628ef14f13ac33e4ace1b679e600a9fbd2f1ba'
  head 'https://github.com/klacke/yaws.git'

  bottle do
    sha1 '8e353366126b49d270d9649fe4a246b1fea1a60e' => :mavericks
    sha1 '0f03e3f4e59c0eec531fe4881e19bc4e327ea288' => :mountain_lion
    sha1 '9f8f9ea6f1381e1bc8ff7380d58e858c862047ab' => :lion
  end

  option "without-yapp", "Omit yaws applications"
  option '32-bit'

  depends_on 'erlang'
  depends_on 'autoconf' => :build

  # the default config expects these folders to exist
  skip_clean 'var/log/yaws'
  skip_clean 'lib/yaws/examples/ebin'
  skip_clean 'lib/yaws/examples/include'

  def install
    if build.build_32_bit?
      %w{ CFLAGS LDFLAGS }.each do |compiler_flag|
        ENV.remove compiler_flag, "-arch #{Hardware::CPU.arch_64_bit}"
        ENV.append compiler_flag, "-arch #{Hardware::CPU.arch_32_bit}"
      end
    end

    system "autoconf"
    system "./configure", "--prefix=#{prefix}"
    system "make install"

    unless build.include? 'without-yapp'
      cd 'applications/yapp' do
        system "make"
        system "make install"
      end
    end

    # the default config expects these folders to exist
    (lib/'yaws/examples/ebin').mkpath
    (lib/'yaws/examples/include').mkpath

    (var/'log/yaws').mkpath
    (var/'yaws/www').mkpath
  end

  def test
    system bin/'yaws', '--version'
  end

end
