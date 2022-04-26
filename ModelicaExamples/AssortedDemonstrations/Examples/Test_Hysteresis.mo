within ModelicaExamples.AssortedDemonstrations.Examples;
model Test_Hysteresis
  extends Modelica.Icons.Example;
  Modelica.Blocks.Logical.Hysteresis hysteresis(
    uLow=0.1*batemanEquations.Ns_start[1],
    uHigh=10*batemanEquations.Ns_start[1],
    pre_y_start=true)
    annotation (Placement(transformation(extent={{-46,-10},{-26,10}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  TRANSFORM.Examples.Demonstrations.Models.BatemanEquations batemanEquations(
      phi=switch1.y)
    annotation (Placement(transformation(extent={{40,-8},{60,12}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-90,20},{-70,40}})));
  Modelica.Blocks.Sources.Constant const1(k=5000)
    annotation (Placement(transformation(extent={{-90,-40},{-70,-20}})));
  Modelica.Blocks.Sources.RealExpression realExpression(y=batemanEquations.Ns[1])
    annotation (Placement(transformation(extent={{-90,-10},{-70,10}})));
equation
  connect(hysteresis.y, switch1.u2)
    annotation (Line(points={{-25,0},{-12,0}}, color={255,0,255}));
  connect(const1.y, switch1.u3) annotation (Line(points={{-69,-30},{-20,-30},{
          -20,-8},{-12,-8}}, color={0,0,127}));
  connect(const.y, switch1.u1) annotation (Line(points={{-69,30},{-20,30},{-20,
          8},{-12,8}}, color={0,0,127}));
  connect(realExpression.y, hysteresis.u)
    annotation (Line(points={{-69,0},{-48,0}}, color={0,0,127}));
  annotation (experiment(
      StopTime=2000,
      __Dymola_NumberOfIntervals=1000,
      __Dymola_Algorithm="Dassl"));
end Test_Hysteresis;
