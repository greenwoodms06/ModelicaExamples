within ModelicaExamples.TCLab.Examples;
model Test_TCLab
  extends Modelica.Icons.Example;
  Models.TCLab tCLab
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,0,0; 20,0,0;
        20,80,0; 100,80,0; 100,80,35; 200,80,35; 200,20,35; 300,20,35; 300,20,
        95; 400,20,95; 400,70,95; 500,70,95; 500,70,25; 600,70,25; 600,50,25;
        700,50,25; 700,50,100; 800,50,100; 800,100,100; 900,100,100; 900,100,45;
        1000,100,45; 1000,0,45; 1100,0,45; 1100,0,0], smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
equation
  connect(combiTimeTable.y[1], tCLab.Q1) annotation (Line(points={{-37,0},{-20,
          0},{-20,6},{-12,6}}, color={0,0,127}));
  connect(combiTimeTable.y[2], tCLab.Q2) annotation (Line(points={{-37,0},{-20,
          0},{-20,-6},{-12,-6}}, color={0,0,127}));
  annotation (experiment(StopTime=1200, __Dymola_Algorithm="Dassl"));
end Test_TCLab;
