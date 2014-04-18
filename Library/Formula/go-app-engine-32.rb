require 'formula'

class GoAppEngine32 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_386-1.9.3.zip'
  sha1 'df881a99aa2ff7bfec5414f1fc980323a5cb7cc0'

  bottle do
    cellar :any
    sha1 "d0a0e6e102d3d55b908a6a3603fc68115dfc2fc9" => :mavericks
    sha1 "c473308fb7f662eb47cf17d43558bd049edb172d" => :mountain_lion
    sha1 "85e042370cd07299c4530a7591a204e97f4a688c" => :lion
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
