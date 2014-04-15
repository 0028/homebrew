require 'formula'

class Terminator < Formula
  homepage 'https://launchpad.net/terminator'
  url 'http://launchpad.net/terminator/trunk/0.97/+download/terminator-0.97.tar.gz'
  sha1 'aa92a6cacd572f6a834ac1de88ae699c7b7dee69'

  bottle do
    cellar :any
    sha1 "5f91a61131f77eb586a1140a9d9d4cab76baaf4b" => :mavericks
    sha1 "4fae2647f230f79572f4c4f80fc004fd6d18d35c" => :mountain_lion
    sha1 "0dae0bb82bfeb2ccf65eb9d4aaf5e7e0f99cfad9" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'intltool' => :build
  depends_on :python
  depends_on :x11
  depends_on 'vte'
  depends_on 'pygtk'
  depends_on 'pygobject'
  depends_on 'pango'

  def patches
    DATA
  end

  def install
    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end
end

__END__
diff --git a/terminatorlib/cwd.py b/terminatorlib/cwd.py
index 7b17d84..e3bdbad 100755
--- a/terminatorlib/cwd.py
+++ b/terminatorlib/cwd.py
@@ -49,6 +49,11 @@ def get_pid_cwd():
         func = sunos_get_pid_cwd
     else:
         dbg('Unable to determine a get_pid_cwd for OS: %s' % system)
+        try:
+            import psutil
+            func = generic_cwd
+        except (ImportError):
+            dbg('psutil not found')
 
     return(func)
 
@@ -71,4 +76,9 @@ def sunos_get_pid_cwd(pid):
     """Determine the cwd for a given PID on SunOS kernels"""
     return(proc_get_pid_cwd(pid, '/proc/%s/path/cwd'))
 
+def generic_cwd(pid):
+    """Determine the cwd using psutil which also supports Darwin"""
+    import psutil
+    return psutil.Process(pid).as_dict()['cwd']
+
 # vim: set expandtab ts=4 sw=4:

