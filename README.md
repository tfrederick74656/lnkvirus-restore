# lnkvirus-restore

### ABOUT
This is a tool designed to help poor network admins suffering from the issue described [here on SpiceWorks](https://community.spiceworks.com/topic/1662889-network-drive-folders-renamed-and-hidden-virus).

When run inside an affected folder, it will rename all of the {GUID} directories back to their original names.

The coding is terrible, due to the fact that I frantically threw it together in the midst of an outbreak of said malware on my own network. You're more than welcome to improve this code, use it in your own project, sell it, or do whatever you want with it.

### USAGE
* Download and install the ActiveState© Perl package for your architecture from [here](http://www.activestate.com/activeperl/downloads).
* Copy the lnkvirus-restore.pl script to the parent of the directory that needs fixed.
* Open command prompt, change to the same directory, and invoke `lnkvirus-restore.pl X:\Directory\` (include the trailing backslash)
* (i.e. if you have a network share at `D:\Share` and a bunch of sub-folders like `D:\Share\{8cc3cecc-6e9a-44e7-9b67-83b497eb1383}`, copy the script to `D:\Share` and invoke `lnk-restore.pl D:\Share\`)
* Watch the magic happen. If the tool hangs, it's because something is open in the folder (common on shared network folders)
* Unhide the folders manually and delete the shortcuts (I didn't bother to implement either of these functions)

### NOTES
* This will attempt to process all (including legitimate) shortcuts, but it just won't do anything about those that don't have the folder GUID at the exact specified offset, which should be none.
* Thanks to [this script](https://sourceforge.net/projects/jafat/files/lnk-parse/lnk-parse-1.0/), from which I borrowed a few lines of code.

### DISCLAIMER
THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
