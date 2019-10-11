-- module use git/lmod-conda/ ; module load miniconda

--prepend_path("PATH", "/home/darstr1/miniconda3-module/bin/")

family("conda")

--local root = "/home/darstr1/miniconda3-module/"
local root = "~/miniconda3/"

remove_path("PATH", pathJoin(root, "condabin")

if myShellName() == "csh" then
   execute{cmd=table.concat({"source ", pathJoin(root, "bin/activate.csh ''")}), modeA={"load"}}

else
   -- The extra '' is needed, or else $@ is set to "module load" and then
   -- "conda activate" gives an error message.
   execute{cmd=table.concat({"source ", pathJoin(root, "bin/activate ''")}), modeA={"load"}}

end

execute{cmd="conda deactivate", modeA={"unload"}}

