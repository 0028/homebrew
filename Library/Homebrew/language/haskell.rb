module Language
  module Haskell
    # module for formulas using cabal-install as build tool
    module Cabal
      def cabal_sandbox
        pwd = Pathname.pwd
        # force cabal to put its stuff here instead of the home directory by
        # pretending the home is here. This also avoid to deal with many options
        # to configure cabal. Note this is also useful with cabal sandbox to
        # avoid touching ~/.cabal
        home = ENV["HOME"]
        ENV["HOME"] = pwd
        # use cabal's sandbox feature if available
        cabal_version = `cabal --version`[/[0-9.]+/].split('.').collect(&:to_i)
        if (cabal_version <=> [1, 18]) == -1
          # no sandbox feature - just use the HOME trick
          cabal_sandbox_bin = pwd/".cabal/bin"
        else
          system "cabal", "sandbox", "init"
          cabal_sandbox_bin = pwd/".cabal-sandbox/bin"
        end
        # cabal may build useful tools that should be found in the PATH
        FileUtils.mkdir_p cabal_sandbox_bin
        path = ENV["PATH"]
        ENV.prepend_path 'PATH', cabal_sandbox_bin
        # update cabal package database
        system "cabal", "update"
        if cabal_version[0,2] == [1, 18]
          # remove this once cabal 1.20 is released and update the cabal-install formula
          # fix https://github.com/haskell/cabal/issues/1777
          cabal_install "--constraint=HTTP>=4000.2.5", "http://johantibell.com/files/Cabal-1.20.0-rc.tar.gz", "http://johantibell.com/files/cabal-install-1.20.0-rc.tar.gz"
        end
        yield
        # restore the environment
        if (cabal_version <=> [1, 18]) > -1
          system "cabal", "sandbox", "delete"
        end
        ENV["HOME"] = home
        ENV["PATH"] = path
      end

      def cabal_install(*opts)
        system "cabal", "install", "--jobs=#{ENV.make_jobs}", *opts
      end

      # remove the development files from the lib directory. cabal-install should
      # be used instead to install haskell packages
      def cabal_clean_lib
        # a better approach may be needed here
        FileUtils.rm_rf lib
      end
  
      def cabal_install_package
        cabal_sandbox do
          # the dependencies are built first and installed locally, and only the
          # current package is actually installed in the destination dir
          cabal_install "--only-dependencies"
          cabal_install "--prefix=#{prefix}"
        end
        cabal_clean_lib
      end
    end
  end
end
