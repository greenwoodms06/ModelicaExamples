within ModelicaExamples.LotkaVolterraModels.Models;
model LotkaVolterraWithControl

  extends BaseClasses.PartialLotkaVolterra;

  Modelica.Blocks.Interfaces.RealInput u
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));

equation
  der(x) = alpha*x - beta*x*y;
  der(y) = -gamma*y + delta*x*y + u;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The Lotka&ndash;Volterra equations, also known as the predator&ndash;prey equations, are a pair of first-order nonlinear differential equations, frequently used to describe the dynamics of biological systems in which two species interact, one as a predator and the other as prey. </p>
<p>This follows the example provided in the resource below for control/optimization/reduced order modeling purposes.</p>
<p><br>Resources:</p>
<ul>
<li>Kaiser, Eurika, J. Nathan Kutz, and Steven L. Brunton. &ldquo;Sparse Identification of Nonlinear Dynamics for Model Predictive Control in the Low-Data Limit.&rdquo; <i>Proceedings of the Royal Society A: Mathematical, Physical and Engineering Sciences</i> 474, no. 2219 (November 2018): 20180335. <a href=\"https://doi.org/10.1098/rspa.2018.0335\">https://doi.org/10.1098/rspa.2018.0335</a>. </li>
</ul>
</html>"),
    experiment(StopTime=25, __Dymola_Algorithm="Dassl"));
end LotkaVolterraWithControl;
