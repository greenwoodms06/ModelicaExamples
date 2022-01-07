within ModelicaExamples.LotkaVolterraModels.Examples;
model Test_LotkaVolterraWithControl
    extends Modelica.Icons.Example;
  LotkaVolterraWithControl simulator(
    alpha=0.5,
    beta=0.025,
    gamma=0.5,
    delta=0.005,
    x_start=50,
    y_start=50)
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(simulator.u, const.y)
    annotation (Line(points={{-10,0},{-39,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"));
end Test_LotkaVolterraWithControl;