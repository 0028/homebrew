require 'formula'

class GitTracker < Formula
  homepage 'https://github.com/stevenharman/git_tracker'
  url 'https://github.com/stevenharman/git_tracker/archive/v1.6.2.tar.gz'
  sha1 'fd0495f3b593b3fbec3104d83faace441893d570'

  head 'https://github.com/stevenharman/git_tracker.git'

  bottle do
    cellar :any
    sha1 "e240fa5ba0495fb2da8564a8607d6376db81f315" => :mavericks
    sha1 "0d7f79642f6639e715e5f259ffd164281ca611a0" => :mountain_lion
    sha1 "4b3ac7c8baae2a3471c218f1027c97e474bc9a24" => :lion
  end

  def install
    rake 'standalone:install', "prefix=#{prefix}"
  end

  test do
    require 'open3'
    Open3.popen3("#{bin}/git-tracker", "help") do |_, stdout, _|
      install_message = /\Agit-tracker \d+(\.\d+)* is installed\.\z/
      assert install_message.match(stdout.readline.strip), "git-tracker is not installed"
    end
  end
end
