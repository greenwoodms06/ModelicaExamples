within ModelicaExamples.BouncingBall.Models;
model BouncingBall "The 'classic' bouncing ball model"
  extends BaseClasses.PartialBouncingBall;

equation
  der(v) = -9.81;
  when h<0 then
    reinit(v, -e*pre(v));
  end when;
end BouncingBall;
