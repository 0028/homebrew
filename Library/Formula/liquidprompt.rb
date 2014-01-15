require 'formula'

class Liquidprompt < Formula
  homepage 'https://github.com/nojhan/liquidprompt'
  url 'https://github.com/nojhan/liquidprompt/archive/v_1.8.tar.gz'
  sha1 'ad481e98b0f6ed251cd65cb01464da151929f081'

  bottle do
    cellar :any
    sha1 'f97edab30c88055757857a4bb42ede091b4ffd82' => :mavericks
    sha1 '4dc6708f984d7e43904d1b4947f03c7853489f9b' => :mountain_lion
    sha1 '6e8be7c00ecef5c10286b4278ef2892b3a369553' => :lion
  end

  def install
    share.install 'liquidpromptrc-dist'
    share.install 'liquidprompt'
  end

  def caveats; <<-EOS.undent
    Add the following lines to your bash or zsh config (e.g. ~/.bash_profile):
      if [ -f #{HOMEBREW_PREFIX}/share/liquidprompt ]; then
        . #{HOMEBREW_PREFIX}/share/liquidprompt
      fi

    NOTE: THIS IS NOW A DIFFERENT LOCATION THAN IN VERSIONS BEFORE 1.8.
    HOMEBREW HAS NEW STANDARDS WHICH PREVENT INSTALLING IN THE OLD LOCATION.
    PLEASE UPDATE YOUR SHELL CONFIG IF YOU'VE USED A PREVIOUS VERSION.

    If you'd like to reconfigure options, you may do so in ~/.liquidpromptrc.
    A sample file you may copy and modify has been installed to
      #{HOMEBREW_PREFIX}/share/liquidpromptrc-dist

    Don't modify the PROMPT_COMMAND variable elsewhere in your shell config;
    that will break things.
    EOS
  end
end
