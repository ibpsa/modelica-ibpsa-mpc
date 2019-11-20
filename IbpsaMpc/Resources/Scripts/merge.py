import buildingspy.development.merger as m
import os
modelicapath = os.environ["MODELICAPATH"]
ibpsa_dir = os.path.join(modelicapath, "IBPSA")
dest_dir = os.path.join(modelicapath, "IbpsaMpc")
mer = m.IBPSA(ibpsa_dir, dest_dir) # doctest: +SKIP

files={
"IBPSA.Fluid.Sources.Boundary_pT": {},
"IBPSA.Fluid.Sources.Boundary_ph": {},
"IBPSA.Fluid.Sources.MassFlowSource_T": {},
"IBPSA.Fluid.Sources.MassFlowSource_h": {},
"IBPSA.Fluid.Sources.PropertySource_T": {},
"IBPSA.Fluid.Sources.PropertySource_h": {},
"IBPSA.Fluid.Sources.BaseClasses.PartialPropertySource": {},
"IBPSA.Fluid.Sources.BaseClasses.PartialSource": {},
"IBPSA.Fluid.Sources.BaseClasses.PartialSource_Xi_C": {},
"IBPSA.Fluid.Interfaces.PartialTwoPort": {},
"IBPSA.Media.Air": {},
"IBPSA.Utilities.Psychrometrics.Constants" : {},
# "": {},
# "": {},

		}

if os.path.exists("merge.patch"):
    mer.finalizeMergeIbpsaMpc()
else:
    print("merge.patch detected, the merge continues. If this is unintentional, remove merge.patch and checkout .copiedFiles .")
    mer.mergeIbpsaMpc(files)
