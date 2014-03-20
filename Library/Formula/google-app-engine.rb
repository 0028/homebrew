require 'formula'

class GoogleAppEngine < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.1.zip'
  sha1 'fd1f0973733fcc3def77d48847d33ae529589d9c'

  bottle do
    sha1 "a939592e0fa430a07933ed1704ac8cf773196391" => :mavericks
    sha1 "6b2859b241c8bac1e0bab0e87a93839a3c5665fb" => :mountain_lion
    sha1 "52f0e50e9c574626625017d46c77324fa61187e3" => :lion
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
