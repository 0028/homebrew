require 'formula'

class AppEngineGo32 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_386-1.9.1.zip'
  sha1 '88615159ed8cc79ff847583370bcdba6f4fd2643'

  bottle do
    cellar :any
    sha1 "943cbdd36d51be48b7b4f588deb19fa38168d3ef" => :mavericks
    sha1 "ee5b176959f3261d9b43484d5d0d25b1ccdf3d5f" => :mountain_lion
    sha1 "305e635a4c4f77a909516b073f84ce55dd8eb70d" => :lion
  end

  def install
    cd '..'
    share.install 'go_appengine' => name
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      bin.install_symlink share/name/fn
    end
  end
end
