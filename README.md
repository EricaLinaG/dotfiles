dotfiles
========

my dotfiles for zsh, Xresources, some shell scripts, etc.

Not much here really. .zshrc has a nice prompt.
zshenv has some nice builtins. 

.Xresources have mostly to do with urxvt and termite.

There is an additional tweak for hidpi monitors if you do a _make hidpi_

/bin is a directory of shell scripts which install in _~/bin_

The [bc-extensions repo](https://github.com/ericgebhart/bc-extensions.git) 
has some nice code if you like using the bc calculator. It also installs
to _~/bin_.


Emacs
-----

I run emacs using my emacsn script. _emacsn_ takes care of running emacs or emacsclient,
as well as evaluating an elisp function on startup. Any additional arguments like files are passed on
to emacs in front of the _--eval_. 
Use help to see more options.
I started using this when I realized I wanted my emacs email client separate from my 
development sessions. It's quite nice to have, try _emacsn -h_ to see what it can do.
Here are a few examples of what it does. It has a lot of help with other options.

* emacsn -h                _=>_  Help!
* emacsn -e                _=>_ emacs -title "Email" --eval "(mu4e)"
* emacsn -m "Foo"          _=>_ emacs -title "Foo" --eval "(main-window)"
* emacsn -m "haskell" *.hs _=>_ emacs -title "haskell" *.hs --eval "(main-window)"
* emacsn -f foo            _=>_ emacs --eval "(foo)"

Adding -c changes it from _emacs_ to _emacsclient -c_

* emacsn -m -c             _=>_ emacsclient -c --eval "(main-window)"

My **main-window** function looks like this:

```
(defun main-window ()
  (interactive)
  (balance-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (split-window-below))
 ```

Install
-------
Where to put stuff.  Or just use make install

* .Xresources ==> ~/     
  * yea. that. fonts colors and what not.
* emacsn ==> ~/bin or where ever you put such things.  
  * a shell script to run emacs in various ways.

Use make
--------
This will create links from this repo, so that you can 
more easily keep track of changes and additions in github,
by keeping all of your work here.

_make install_

if you have a high dots per inch monitor...
_make hidpi_

That should do it.


