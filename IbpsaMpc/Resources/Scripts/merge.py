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
"IBPSA.Fluid.MixingVolumes.MixingVolume" : {},
"IBPSA.Fluid.MixingVolumes.BaseClasses.PartialMixingVolume" : {},
"IBPSA.Fluid.Interfaces.LumpedVolumeDeclarations" : {},
"IBPSA.Fluid.Interfaces.StaticTwoPortConservationEquation" : {},
"IBPSA.Fluid.Interfaces.PartialTwoPortInterface" : {},
"IBPSA.Fluid.Interfaces.PartialTwoPort" : {},
"IBPSA.Fluid.Interfaces.ConservationEquation": {},
# "": {},

		}

mer.mergeIbpsaMpc(files)
