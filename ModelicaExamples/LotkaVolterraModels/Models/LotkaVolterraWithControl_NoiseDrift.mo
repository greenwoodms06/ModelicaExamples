within ModelicaExamples.LotkaVolterraModels.Models;
model LotkaVolterraWithControl_NoiseDrift

  extends BaseClasses.PartialLotkaVolterra;

  Modelica.Blocks.Interfaces.RealInput u_x
    annotation (Placement(transformation(extent={{-140,20},{-100,60}})));
  Modelica.Blocks.Interfaces.RealInput u_y
    annotation (Placement(transformation(extent={{-140,-60},{-100,-20}})));
  Modelica.Blocks.Noise.NormalNoise noise[2](
    samplePeriod=samplePeriod,
    each useGlobalSeed=false,
    each useAutomaticLocalSeed=false,
    fixedLocalSeed={1,1234},
    mu=mu,
    sigma=sigma)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Real drift[2] = {0,0} "Constant drift";

  parameter SI.Period samplePeriod[2]={0.1,0.1}
    "Period for sampling the raw random numbers" annotation (Dialog(group="Noise"));
  parameter Real mu[2]={0,0} "Expectation (mean) value of the normal distribution"
    annotation (Dialog(group="Noise"));
  parameter Real sigma[2]={1,1} "Standard deviation of the normal distribution"
    annotation (Dialog(group="Noise"));

equation
  der(x) =alpha*x - beta*x*y + u_x + noise[1].y + drift[1];
  der(y) =-gamma*y + delta*x*y + u_y + noise[2].y + drift[2];

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
end LotkaVolterraWithControl_NoiseDrift;
