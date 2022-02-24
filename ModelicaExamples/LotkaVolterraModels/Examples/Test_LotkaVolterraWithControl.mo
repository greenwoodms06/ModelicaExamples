within ModelicaExamples.LotkaVolterraModels.Examples;
model Test_LotkaVolterraWithControl
    extends Modelica.Icons.Example;
  Models.LotkaVolterraWithControl simulator(
    alpha=0.5,
    beta=0.025,
    gamma=0.5,
    delta=0.005,
    x_start=50,
    y_start=50)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(simulator.u_y, const.y) annotation (Line(points={{-12,-4},{-24,-4},{
          -24,0},{-39,0}}, color={0,0,127}));
  connect(const.y, simulator.u_x) annotation (Line(points={{-39,0},{-24,0},{-24,
          4},{-12,4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"));
end Test_LotkaVolterraWithControl;
