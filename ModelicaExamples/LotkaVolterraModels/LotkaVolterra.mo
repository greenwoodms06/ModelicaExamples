within ModelicaExamples.LotkaVolterraModels;
model LotkaVolterra
  extends BaseClasses.PartialLotkaVolterra;

equation
  der(x) = alpha*x - beta*x*y;
  der(y) = -gamma*y + delta*x*y;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>The Lotka&ndash;Volterra equations, also known as the predator&ndash;prey equations, are a pair of first-order nonlinear differential equations, frequently used to describe the dynamics of biological systems in which two species interact, one as a predator and the other as prey. </p>
<p><br>Resources:</p>
<ul>
<li>https://en.wikipedia.org/wiki/Lotka&percnt;E2&percnt;80&percnt;93Volterra_equations</li>
<li>https://mathworld.wolfram.com/Lotka-VolterraEquations.html</li>
</ul>
</html>"),
    experiment(StopTime=20, __Dymola_Algorithm="Dassl"));
end LotkaVolterra;
