require 'formula'

class Minidlna < Formula
  homepage 'http://sourceforge.net/projects/minidlna/'
  url 'https://downloads.sourceforge.net/project/minidlna/minidlna/1.1.2/minidlna-1.1.2.tar.gz'
  sha1 'ba03d691b9aa95b55ac822905571ab1127492344'

  bottle do
    sha1 "5f21e57a807bf0af7950bd6707b1531187b28676" => :mavericks
    sha1 "e9066fbf04cc211519f927509f85c6dfe5803352" => :mountain_lion
    sha1 "77009b819865a329a0aab9f2aae15631fa1bd5a2" => :lion
  end

  depends_on 'libav'
  depends_on 'libexif'
  depends_on 'jpeg'
  depends_on 'libid3tag'
  depends_on 'flac'
  depends_on 'libogg'
  depends_on 'libvorbis'
  depends_on 'sqlite'
  depends_on 'ffmpeg'

  def patches
    [
      # From http://sourceforge.net/p/minidlna/patches/104/
      "http://sourceforge.net/p/minidlna/patches/104/attachment/0001-Remove-check-for-getifaddr-returning-IFF_SLAVE-if-IF.patch",
    ]
  end

  def install
    ENV.append_to_cflags '-std=gnu89'
    system "./configure", "--exec-prefix=#{prefix}"
    system "make", "install"
    sample_config_path.write sample_config
  end

  def caveats
    s = <<-EOS.undent
      Simple single-user configuration:

      mkdir -p ~/.config/minidlna
      cp #{sample_config_path} ~/.config/minidlna/minidlna.conf
      ln -s YOUR_MEDIA_DIR ~/.config/minidlna/media
      minidlnad -f ~/.config/minidlna/minidlna.conf -P ~/.config/minidlna/minidlna.pid
    EOS
  end

  def sample_config_path
    share + "minidlna/minidlna.conf"
  end

  def sample_config; <<-EOS.undent
    friendly_name=Mac DLNA Server
    media_dir=#{ENV['HOME']}/.config/minidlna/media
    db_dir=#{ENV['HOME']}/.config/minidlna/cache
    log_dir=#{ENV['HOME']}/.config/minidlna
    EOS
  end

  test do
    system "#{sbin}/minidlnad", "-V"
  end
end
