require 'formula'

class Dockutil < Formula
  homepage 'https://github.com/kcrawford/dockutil'
  url 'https://github.com/kcrawford/dockutil/archive/4ec75cf3d4dcd3ca3923525c6d659e40baf174b9.tar.gz'
  sha1 'bfb8db52d30dc254a76a34d8434d66b2bf8792e7'
  version '1.1.4'

  bottle do
    sha1 '62edca6daa6997b0fda341b75efd353394fbec65' => :mavericks
    sha1 '3b92c9f1d4122f8d0d9789ec6a1e5d939b54dbb0' => :mountain_lion
    sha1 '378ab458c324137c7eca9a93c22197b8adfe1a16' => :lion
  end

  depends_on :python

  resource 'plistlib' do
    url 'https://pypi.python.org/packages/source/p/plist/plist-0.2.tar.gz'
    sha1 'eac8a0d71a20515f955101429101b3b9f445f809'
  end

  def install
    install_args = [ "setup.py", "install", "--prefix=#{libexec}" ]

    python do
      resource('plistlib').stage { system python, *install_args }
    end

    bin.install 'scripts/dockutil'
  end

  test do
    assert_equal "1.1.4", `#{bin}/dockutil --version`.strip
  end
end
