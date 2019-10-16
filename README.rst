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

This provides Lmod modulefiles which allow Lmod to natively activate
and deactivate conda environments.  Most importantly, it does the
shell integration so that users can create/activate their own
environments without making changes to their own shell.

Currently two options under development:


``conda.lua``
-------------

A modulefile which sources the upstream ``activate`` and
``deactivate`` scripts, so completely uses the conda machinery.  This
leaves some effects in the user's shell once conda is deactivated: the
``conda`` shell alias stays defined, and also it leaves a ``condabin``
directory on ``PATH`` which contains only the binary ``conda`` in it.


``conda2.lua``
--------------

This reproduces the logic of conda in native Lmod, so doesn't leave as
much effect in the user's shell.  Lmod modifies ``PATH``, sets
``CONDA_PREFIX``, ``CONDA_EXE``, and other environment variables, and
sources ``conda.sh`` to define the ``conda`` shell alias.  When
unloading, unsets the env var and unsets the alias.  (There are some
minor shell functions still defined).  Because it doesn't do a native
``conda activate``, it can be cleaned up better.

If the user does their own ``conda activate`` and/or ``conda
deactivate``, then not all effects will be cleaned up when the module
is unloaded.  But I think it's reasonable that they are on their own
then.

To use this, conda's ``/etc/profile.d/conda.sh`` has to be put next to
the modulefile.


Usage notes
-----------

Alpha, please send patches!


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
Please do send fixes though.

Developed at Aalto University.
