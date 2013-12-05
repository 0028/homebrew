require 'formula'

class Passenger < Formula
  homepage 'https://www.phusionpassenger.com/'
  url 'http://s3.amazonaws.com/phusion-passenger/releases/passenger-4.0.27.tar.gz'
  sha1 'e5ee41b9639dc2785039e67e20069961f904790a'
  head 'https://github.com/phusion/passenger.git'

  bottle do
    sha1 '35a417ec168735488d6e6e9eb12c42be3f0d8b8e' => :mavericks
    sha1 'ef17cfba334e0a808ee9f78ceaa7dac0fe4e089e' => :mountain_lion
    sha1 '608396baa603deb6ef20f5a767690740fdd79f5a' => :lion
  end

  depends_on :macos => :lion
  depends_on 'curl'

  def install
    rake "apache2"
    rake "nginx"

    necessary_files = Dir["configure", "Rakefile", "README.md", "CONTRIBUTORS",
      "CONTRIBUTING.md", "LICENSE", "INSTALL.md", "NEWS", "passenger.gemspec",
      "build", "lib", "node_lib", "bin", "doc", "man", "helper-scripts",
      "ext", "resources", "buildout"]
    libexec.mkpath
    cp_r necessary_files, libexec, :preserve => true

    # The various scripts in bin cannot correctly locate their root directory
    # when invoked as symlinks in /usr/local/bin. We create wrapper scripts
    # to solve this problem.
    bin.mkpath
    Dir[libexec/"bin/*"].each do |orig_script|
      name = File.basename(orig_script)
      (bin/name).write <<-EOS.undent
        #!/bin/sh
        exec #{orig_script} "$@"
      EOS
    end
    mv libexec/'man', share
  end

  def caveats; <<-EOS.undent
    To activate Phusion Passenger for Apache, create /etc/apache2/other/passenger.conf:
      LoadModule passenger_module #{opt_prefix}/libexec/buildout/apache2/mod_passenger.so
      PassengerRoot #{opt_prefix}/libexec
      PassengerDefaultRuby /usr/bin/ruby

    To activate Phusion Passenger for Nginx, run:
      brew install nginx --with-passenger
    EOS
  end

  test do
    if `#{HOMEBREW_PREFIX}/bin/passenger-config --root`.strip != libexec.to_s
      raise "Invalid root path"
    end
  end
end
