require 'formula'

class AppEnginePython < Formula
  homepage 'https://developers.google.com/appengine/'
  url 'https://commondatastorage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.1.zip'
  sha1 'fd1f0973733fcc3def77d48847d33ae529589d9c'

  bottle do
    cellar :any
    sha1 "2b85ed27c323ad7c0f666b1b4d980fc8e40031bf" => :mavericks
    sha1 "c97f94a623cbdc252fe5ddd292c5ad1b8479f8c4" => :mountain_lion
    sha1 "375c63eaafc0a43d2756f70ffaf0c8e1730c8ff5" => :lion
  end

  def install
    cd '..'
    share.install 'google_appengine' => name
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
      bin.install_symlink share/name/fn
    end
  end
end
