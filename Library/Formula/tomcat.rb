require 'formula'

class Tomcat < Formula
  homepage 'http://tomcat.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52.tar.gz'
  sha1 'adb171c420a6b0a042e2102a76fb70ac4da06a44'

  bottle do
    cellar :any
    sha1 "cd0f7156d5d3da326ccfbec48be8c0c747870b53" => :mavericks
    sha1 "27bacc6c1f1dc4d079a59625d0250c1af7431bc6" => :mountain_lion
    sha1 "8f2409ec72d6875af72db03680d6e1b9332b50c0" => :lion
  end

  option "with-fulldocs", "Install full documentation locally"

  devel do
    url 'http://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-8/v8.0.3/bin/apache-tomcat-8.0.3.tar.gz'
    sha1 'f98f796c17c7653fc6bceac8be049df1e2bedc4d'

    resource 'fulldocs' do
      url 'http://www.apache.org/dyn/closer.cgi?path=/tomcat/tomcat-8/v8.0.3/bin/apache-tomcat-8.0.3-fulldocs.tar.gz'
      version '8.0.3'
      sha1 '3270682abb87d8ec94beabf4ca4952807c6aa6db'
    end
  end

  resource 'fulldocs' do
    url 'http://www.apache.org/dyn/closer.cgi?path=/tomcat/tomcat-7/v7.0.52/bin/apache-tomcat-7.0.52-fulldocs.tar.gz'
    version '7.0.52'
    sha1 'a635011c8d3643c595102850740d0290f37f44b5'
  end

  # Keep log folders
  skip_clean 'libexec'

  def install
    # Remove Windows scripts
    rm_rf Dir['bin/*.bat']

    # Install files
    prefix.install %w{ NOTICE LICENSE RELEASE-NOTES RUNNING.txt }
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/catalina.sh" => "catalina"

    (share/'fulldocs').install resource('fulldocs') if build.with? 'fulldocs'
  end
end
