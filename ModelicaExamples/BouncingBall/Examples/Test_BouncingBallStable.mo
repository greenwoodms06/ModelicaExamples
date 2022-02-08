within ModelicaExamples.BouncingBall.Examples;
model Test_BouncingBallStable
  extends Modelica.Icons.Example;

  Models.BouncingBallStable
                      simulator
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=5, __Dymola_Algorithm="Dassl"));
end Test_BouncingBallStable;
