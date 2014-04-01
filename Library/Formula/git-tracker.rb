require 'formula'

class GitTracker < Formula
  homepage 'https://github.com/stevenharman/git_tracker'
  url 'https://github.com/stevenharman/git_tracker/archive/v1.6.3.tar.gz'
  sha1 'c748e564f176165dba2498637e0b99f27647b88a'

  head 'https://github.com/stevenharman/git_tracker.git'

  bottle do
    cellar :any
    sha1 "d93e0b14dfaa00813b8007ea7e925d64a7f57407" => :mavericks
    sha1 "5ab91e26063cfb43fead69ef0c6d3af7917357ac" => :mountain_lion
    sha1 "fe880c93f2ef8707bbf7ed587dd0b8e407f7a2a5" => :lion
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
