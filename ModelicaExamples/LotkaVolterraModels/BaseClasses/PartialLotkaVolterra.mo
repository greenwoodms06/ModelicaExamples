within ModelicaExamples.LotkaVolterraModels.BaseClasses;
partial model PartialLotkaVolterra

  parameter Real alpha = 1.5 "Growth rate of prey";
  parameter Real beta = 1 "Rate at which predators destroy prey";
  parameter Real gamma = 3 "Death rate of predators";
  parameter Real delta = 1 "Rate at which predators increase by consuming prey";

  parameter Real x_start = 10 "Initial prey population" annotation(Dialog(tab="Iniitialization"));
  parameter Real y_start = 5 "Initial predator population" annotation(Dialog(tab="Iniitialization"));

  Modelica.Blocks.Interfaces.RealOutput x(start=x_start) "Prey population"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput y(start=y_start) "Predator population"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));

// initial equation
//   x = x_start;
//   y = y_start;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PartialLotkaVolterra;
