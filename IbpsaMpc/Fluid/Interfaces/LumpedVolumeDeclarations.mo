within IbpsaMpc.Fluid.Interfaces;
record LumpedVolumeDeclarations "Declarations for lumped volumes"
  replaceable package Medium =
    Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choices(
        choice(redeclare package Medium = IbpsaMpc.Media.Air "Moist air"),
        choice(redeclare package Medium = IbpsaMpc.Media.Water "Water"),
        choice(redeclare package Medium =
            IbpsaMpc.Media.Antifreeze.PropyleneGlycolWater (
              property_T=293.15,
              X_a=0.40)
              "Propylene glycol water, 40% mass fraction")));

  // Assumptions
  parameter Modelica.Fluid.Types.Dynamics energyDynamics=Modelica.Fluid.Types.Dynamics.DynamicFreeInitial
    "Type of energy balance: dynamic (3 initialization options) or steady state"
    annotation(Evaluate=true, Dialog(tab = "Dynamics", group="Equations"));
  parameter Modelica.Fluid.Types.Dynamics massDynamics=energyDynamics
    "Type of mass balance: dynamic (3 initialization options) or steady state"
    annotation(Evaluate=true, Dialog(tab = "Dynamics", group="Equations"));
  final parameter Modelica.Fluid.Types.Dynamics substanceDynamics=energyDynamics
    "Type of independent mass fraction balance: dynamic (3 initialization options) or steady state"
    annotation(Evaluate=true, Dialog(tab = "Dynamics", group="Equations"));
  final parameter Modelica.Fluid.Types.Dynamics traceDynamics=energyDynamics
    "Type of trace substance balance: dynamic (3 initialization options) or steady state"
    annotation(Evaluate=true, Dialog(tab = "Dynamics", group="Equations"));

  // Initialization
  parameter Medium.AbsolutePressure p_start = Medium.p_default
    "Start value of pressure"
    annotation(Dialog(tab = "Initialization"));
  parameter Medium.Temperature T_start=Medium.T_default
    "Start value of temperature"
    annotation(Dialog(tab = "Initialization"));
  parameter Medium.MassFraction X_start[Medium.nX](
       quantity=Medium.substanceNames) = Medium.X_default
    "Start value of mass fractions m_i/m"
    annotation (Dialog(tab="Initialization", enable=Medium.nXi > 0));
  parameter Medium.ExtraProperty C_start[Medium.nC](
       quantity=Medium.extraPropertiesNames)=fill(0, Medium.nC)
    "Start value of trace substances"
    annotation (Dialog(tab="Initialization", enable=Medium.nC > 0));
  parameter Medium.ExtraProperty C_nominal[Medium.nC](
       quantity=Medium.extraPropertiesNames) = fill(1E-2, Medium.nC)
    "Nominal value of trace substances. (Set to typical order of magnitude.)"
   annotation (Dialog(tab="Initialization", enable=Medium.nC > 0));
  parameter Real mSenFac(min=1)=1
    "Factor for scaling the sensible thermal mass of the volume"
    annotation(Dialog(tab="Dynamics"));

annotation (preferredView="info",
Documentation(info="<html>
<p>
This class contains parameters and medium properties
that are used in the lumped  volume model, and in models that extend the
lumped volume model.
</p>
<p>
These parameters are used for example by
<a href=\"modelica://IbpsaMpc.Fluid.Interfaces.ConservationEquation\">
IbpsaMpc.Fluid.Interfaces.ConservationEquation</a>,
<a href=\"modelica://IbpsaMpc.Fluid.MixingVolumes.MixingVolume\">
IbpsaMpc.Fluid.MixingVolumes.MixingVolume</a> and
<a href=\"modelica://IbpsaMpc.Fluid.HeatExchangers.Radiators.RadiatorEN442_2\">
IbpsaMpc.Fluid.HeatExchangers.Radiators.RadiatorEN442_2</a>.
</p>
</html>",
revisions="<html>
<ul>
<li>
January 18, 2019, by Jianjun Hu:<br/>
Limited the media choice.
See <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1050\">#1050</a>.
</li>
<li>
November 9, 2018 by Michael Wetter:<br/>
Limited choices of media that are displayed in the pull down menu of
graphical editors.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1050\">issue 1050</a>.
</li>
<li>
April 11, 2016 by Michael Wetter:<br/>
Corrected wrong hyperlink in documentation for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/450\">issue 450</a>.
</li>
<li>
January 26, 2016, by Michael Wetter:<br/>
Added <code>quantity=Medium.substanceNames</code> for <code>X_start</code>.
</li>
<li>
October 21, 2014, by Filip Jorissen:<br/>
Added parameter <code>mFactor</code> to increase the thermal capacity.
</li>
<li>
August 2, 2011, by Michael Wetter:<br/>
Set <code>substanceDynamics</code> and <code>traceDynamics</code> to final
and equal to <code>energyDynamics</code>,
as there is no need to make them different from <code>energyDynamics</code>.
</li>
<li>
August 1, 2011, by Michael Wetter:<br/>
Changed default value for <code>energyDynamics</code> to
<code>Modelica.Fluid.Types.Dynamics.DynamicFreeInitial</code> because
<code>Modelica.Fluid.Types.Dynamics.SteadyStateInitial</code> leads
to high order DAE that Dymola cannot reduce.
</li>
<li>
July 31, 2011, by Michael Wetter:<br/>
Changed default value for <code>energyDynamics</code> to
<code>Modelica.Fluid.Types.Dynamics.SteadyStateInitial</code>.
</li>
<li>
April 13, 2009, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end LumpedVolumeDeclarations;
