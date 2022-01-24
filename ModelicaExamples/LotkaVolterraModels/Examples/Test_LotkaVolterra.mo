within ModelicaExamples.LotkaVolterraModels.Examples;
model Test_LotkaVolterra
  extends Modelica.Icons.Example;

  Models.LotkaVolterra simulator
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=20, __Dymola_Algorithm="Dassl"));
end Test_LotkaVolterra;
