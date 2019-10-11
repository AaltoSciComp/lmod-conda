Conda integraiton for Lmod
==========================

You use Lmod to manage software, and you also deploy software using
conda.  You want to use Lmod to allow people ta activate your conda
environments, but it's actually a bit more difficult than you'd like:
you can prepend the right thing to ``PATH``, but conda also requires
some shell aliases to be defined and leaves some stuff in ``PATH``
even after it deactiavtes.  Also, then users can't activate and
deactivate environments (in recent conda) - and conda by default wants
users to "activate their shell for conda", which has user-wide
effects which you'd probably like to avoid.

This provides Lmod modulefiles which allow Lmod to natively activate and deactivate conda environments.  Most importantly

Currently two options under development:

* ``miniconda.lua`` - a modulefile which sources the ``activate`` and
  ``deactivate`` scripts, so completly uses the conda machinery.  This
  leaves some effects in the user's shell once conda is deactivated.

* ``miniconda2.lua`` - reproduces the logic of conda in native Lmod.
  Doesn't leave as much effect in the user's shell.  To use this, the
  ``conda.sh`` has to be put next to the modulefile.

Usage notes
-----------


Conda internals notes
---------------------

If you just prepend the right thing to ``PATH``, it works to run
programs but not for users to ``conda create`` and ``conda activate``.

See also
--------

* Lmod: https://lmod.readthedocs.io/en/latest/050_lua_modulefiles.html
* Conda: https://docs.conda.io/


Development and maintnance
--------------------------

In active development, don't use unless you are willing to fix bugs.

Developed at Aalto University.
