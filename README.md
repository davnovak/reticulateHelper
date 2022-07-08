# reticulateHelper

Helper functions that make using Anaconda environments in reticulate *actually* work.

<hr>

In most cases, switching between Anaconda environments in `reticulate` (R package for interfacing with Python) failed for me.

The included function `conda_activate` forces `reticulate` to switch to an Anaconda environment by unloading `reticulate` namespace if loaded, changes the Python version environment variable and then activates the Anaconda environment.
Beware, this changes the value of your `RETICULATE_PYTHON` environment variable.

`conda_run` does all that, then runs some code (given as function `f` and list of parameter values `par` and then sets `RETICULATE_PYTHON` back to what its value was at the beginning.

