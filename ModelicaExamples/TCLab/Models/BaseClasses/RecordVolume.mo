within ModelicaExamples.TCLab.Models.BaseClasses;
record RecordVolume
  parameter SI.Volume V = 1e-6;
  parameter SI.Density d = 1000;
  parameter SI.SpecificHeatCapacity cp = 500;
  parameter SI.Temperature T_start = 298.15;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end RecordVolume;
