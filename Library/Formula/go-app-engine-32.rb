require 'formula'

class GoAppEngine32 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_darwin_386-1.9.1.zip'
  sha1 '88615159ed8cc79ff847583370bcdba6f4fd2643'

  bottle do
    sha1 "4938feb7514754ad35201b2ce00130cc251180cb" => :mavericks
    sha1 "deadd8d1b225dd273e17501f7ebd1da5058c7708" => :mountain_lion
    sha1 "8d7df26345249470740059c38cded994d5fafe80" => :lion
  end

  def install
    cd '..'
    share.install 'go_appengine' => name
    bin.mkpath
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
