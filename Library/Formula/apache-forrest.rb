require 'formula'

class ApacheForrest < Formula
  homepage 'http://forrest.apache.org/'
  url 'http://www.apache.org/dyn/closer.cgi?path=forrest/apache-forrest-0.9-sources.tar.gz'
  sha1 '8c7b49a7dff4b3f60a52c7696684168b6d454a47'

  bottle do
    cellar :any
    sha1 '7750c5b70069d118f2a59e0cc42c1fac960ae7e8' => :mavericks
    sha1 'e9f85aefaf2b1c50699b6a5ec8f882f20bd0969c' => :mountain_lion
    sha1 '9824c895d784f5217442265ca7271522c0deeffe' => :lion
  end

  resource 'deps' do
    url 'http://www.apache.org/dyn/closer.cgi?path=forrest/apache-forrest-0.9-dependencies.tar.gz'
    sha1 '10a4442d46baeadd3ba3377ed29ed694c86ece25'
  end

  # Prevent deletion of intentionally-empty subdirs inside of
  # template directories:
  skip_clean ["libexec/main/template-sites", "libexec/main/fresh-site",
              "libexec/plugins/pluginTemplate"]

  def install
    libexec.install Dir['*']
    bin.install_symlink "#{libexec}/bin/forrest"

    # To avoid conflicts with directory names already installed from the
    # main tarball, surgically install contents of dependency tarball
    deps_to_install = [
      "lib",
      "main/webapp/resources/schema/relaxng",
      "main/webapp/resources/stylesheets",
      "plugins/org.apache.forrest.plugin.output.pdf/",
      "tools/ant",
      "tools/forrestbot/lib",
      "tools/forrestbot/webapp/lib",
      "tools/jetty"
    ]
    resource('deps').stage do
      deps_to_install.each { |p| (libexec + p).install Dir[p+"/*"] }
    end
  end

  test do
    system "#{bin}/forrest", "-projecthelp"
  end
end
