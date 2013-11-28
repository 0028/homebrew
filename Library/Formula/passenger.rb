require 'formula'

class Passenger < Formula
  homepage 'https://www.phusionpassenger.com/'
  url 'http://s3.amazonaws.com/phusion-passenger/releases/passenger-4.0.26.tar.gz'
  sha1 'd41bbf70bd41d6bf34f2a582b129c3ea0b44c345'
  head 'https://github.com/phusion/passenger.git'

  bottle do
    sha1 '283d6b3e4f8b77b995df4278ca8776d6a48a176e' => :mavericks
    sha1 '844ea31b70fc3b026dbac38becd0ce85c820f64a' => :mountain_lion
    sha1 '63a4fb0a4162e3b4a13fb3921dce583b3fb74a8e' => :lion
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
