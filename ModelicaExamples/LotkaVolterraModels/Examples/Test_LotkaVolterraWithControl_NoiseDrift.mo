within ModelicaExamples.LotkaVolterraModels.Examples;
model Test_LotkaVolterraWithControl_NoiseDrift
  extends Modelica.Icons.Example;

  parameter Real alpha=0.5 "Growth rate of prey";
  parameter Real beta=0.025 "Rate at which predators destroy prey";
  parameter Real gamma=0.5 "Death rate of predators";
  parameter Real delta=0.005
    "Rate at which predators increase by consuming prey";
  parameter Real x_start=50 "Initial prey population";
  parameter Real y_start=50 "Initial predator population";
  parameter Real setpoints[2]={gamma/delta,alpha/beta}
    "Solutions (x,y) at the critical (SS) point";

  Models.LotkaVolterraWithControl_NoiseDrift
                       simulator(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start,
    drift={0,0},
    samplePeriod={0.1,0.2},
    sigma={0,0})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(const.y, simulator.u_x) annotation (Line(points={{-39,0},{-28,0},{-28,
          4},{-12,4}}, color={0,0,127}));
  connect(const.y, simulator.u_y) annotation (Line(points={{-39,0},{-28,0},{-28,
          -4},{-12,-4}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"));
end Test_LotkaVolterraWithControl_NoiseDrift;
