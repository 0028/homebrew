require 'formula'

class AppEngineGo64 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_amd64-1.9.1.zip'
  sha1 '3a0b848bc538a36a9d4aa896d206f4a95891f322'

  bottle do
    cellar :any
    sha1 "aaba49bdb9fec02b40bf4539ae92ae5c60d7b45a" => :mavericks
    sha1 "935138a983ee868da0ecd3f930b9450b04b5732a" => :mountain_lion
    sha1 "ca840260d0cc3774dac35db40f8f9cdd8ef5e4c0" => :lion
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
