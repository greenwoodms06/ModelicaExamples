within ModelicaExamples.BouncingBall.Models;
model BouncingBallStable
  "The 'classic' bouncing ball model with numerical tolerances"
  extends BaseClasses.PartialBouncingBall;

  constant Height eps=1e-3 "Small height";
  Boolean done "Flag when to turn off gravity";

initial equation
  done = false;

equation
  der(v) = if done then 0 else -9.81;
  when {h<0,h<-eps} then
    done = h<-eps;
    reinit(v, -e*(if h<-eps then 0 else pre(v)));
  end when;
end BouncingBallStable;
