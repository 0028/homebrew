module Homebrew
  module Assertions

    # Returns the stripped output of running cmdline, and asserts
    # the given exit status.
    def shell(cmd, result=0)
      output = `#{cmd}`.strip
      assert_equal result, $?.exitstatus
      return output
    end

    def pipe(cmd, input=nil)
      IO.popen(cmd, "w+") do |pipe|
        unless input.nil?
          pipe.write input
          pipe.close_write
        end
        return pipe.read
      end
    end
  end
end
