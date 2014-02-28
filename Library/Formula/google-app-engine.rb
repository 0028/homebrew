require 'formula'

class GoogleAppEngine < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.0.zip'
  sha1 '923a7f99e058d93408d3940e0307bdf2769b7480'

  bottle do
    cellar :any
    sha1 "2c33c24725c7dbcafa7de9bfea7ff20028c88ba2" => :mavericks
    sha1 "e9e9df6e2d4106f75f790186ea2b07b5b9e01886" => :mountain_lion
    sha1 "6257bc2190349436b902a1c1e3da07f783a199ef" => :lion
  end

  def install
    cd '..'
    share.install 'google_appengine' => name
    bin.mkpath
    %w[
      _python_runtime.py
      _php_runtime.py
      api_server.py
      appcfg.py
      bulkload_client.py
      bulkloader.py
      dev_appserver.py
      download_appstats.py
      endpointscfg.py
      gen_protorpc.py
      google_sql.py
      old_dev_appserver.py
      remote_api_shell.py
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
