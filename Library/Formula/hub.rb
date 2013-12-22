require 'formula'

class Hub < Formula
  homepage 'http://hub.github.com/'
  url 'https://github.com/github/hub/archive/v1.11.0.tar.gz'
  sha1 'fea06d242af3be473b78bb738a04afc11ca4df21'
  head 'https://github.com/github/hub.git'

  bottle do
    cellar :any
    sha1 '7b984682aafcb37412ab2beea6074ad8094a3454' => :mavericks
    sha1 'fc9e3f26f4fbdb1967b68b5c90f030df355669ed' => :mountain_lion
    sha1 '57ef748f105588b8ac72aafe9c0d92088c7e2a09' => :lion
  end

  option 'without-completions', 'Disable bash/zsh completions'

  def install
    ENV['GIT_DIR'] = downloader.cached_location/'.git' if build.head?

    rake "install", "prefix=#{prefix}"

    unless build.without? 'completions'
      bash_completion.install 'etc/hub.bash_completion.sh'
      zsh_completion.install 'etc/hub.zsh_completion' => '_hub'
    end
  end

  test do
    system "#{bin}/hub version | grep 'hub version #{version}'"
  end
end
