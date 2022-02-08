within ModelicaExamples.LotkaVolterraModels.Examples;
model Test_LotkaVolterraMPC
  extends Modelica.Icons.Example;

  parameter Real alpha=0.5 "Growth rate of prey";
  parameter Real beta=0.025 "Rate at which predators destroy prey";
  parameter Real gamma=0.5 "Death rate of predators";
  parameter Real delta=0.005
    "Rate at which predators increase by consuming prey";
  parameter Real x_start=50 "Initial prey population";
  parameter Real y_start=50 "Initial predator population";
  parameter Real setpoints[2]={gamma/delta,alpha/beta}
    "Solutions (x,y) at the critical (SS) point";

  Models.LotkaVolterraWithControl simulatorPI_y(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Modelica.Blocks.Sources.Constant setpoint_y(k=setpoints[2])
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  TRANSFORM.Controls.LimPID PID_y(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    k_s=1/simulatorPI_y.x_start,
    k_m=1/simulatorPI_y.x_start)
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  TRANSFORM.Controls.LimPID PID_x(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    k_s=1/simulatorPI_y.x_start,
    k_m=1/simulatorPI_y.x_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant setpoint_x(k=setpoints[1])
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable1(
    tableOnFile=false,
    table=[0,-48.98668471; 0.833333333,-4.581446307; 1.666666667,15.9686184;
        2.5,-3.393309985; 3.333333333,14.84712929; 4.166666667,-2.335866144; 5,
        13.8501097; 5.833333333,-1.396717477; 6.666666667,12.96375805; 7.5,-0.562543315;
        8.333333333,12.18158698; 9.166666667,0.174302225; 10,11.4867442;
        10.83333333,0.82849159; 11.66666667,10.86965302; 12.5,1.410873992;
        13.33333333,10.3202086; 14.16666667,1.929776163; 15,9.832166165;
        15.83333333,2.387812541; 16.66666667,9.400628701; 17.5,2.795018898;
        18.33333333,9.018364768; 19.16666667,3.154891729; 20,8.677397722;
        20.83333333,3.476132777; 21.66666667,8.376155643; 22.5,3.759329378;
        23.33333333,8.1093344; 24.16666667,4.011991536; 25,7.870839553;
        25.83333333,4.23580024; 26.66666667,7.660097599; 27.5,4.434612063;
        28.33333333,7.473016994; 29.16666667,4.610110517; 30,7.30654629;
        30.83333333,4.770230675; 31.66666667,7.156738188; 32.5,4.907771221;
        33.33333333,7.027901845; 34.16666667,5.030529077; 35,6.910355825;
        35.83333333,5.141552056; 36.66666667,6.807343481; 37.5,5.239130319;
        38.33333333,6.714621192; 39.16666667,5.325850845; 40,6.633244809;
        40.83333333,5.401624089; 41.66666667,6.562779365; 42.5,5.469084231;
        43.33333333,6.498064542; 44.16666667,5.53035175; 45,6.441621072;
        45.83333333,5.582105148; 46.66666667,6.391808736; 47.5,5.63034235;
        48.33333333,6.346993762; 49.16666667,5.671288371; 50,6.306787042;
        50.83333333,5.711890325; 51.66666667,6.270046266; 52.5,5.743514529;
        53.33333333,6.241002069; 54.16666667,5.772193377; 55,6.215266769;
        55.83333333,5.794190581; 56.66666667,6.190780071; 57.5,5.820836155;
        58.33333333,6.167175757; 59.16666667,5.841654441; 60,6.147098845;
        60.83333333,5.860958136; 61.66666667,6.130071147; 62.5,5.876732691;
        63.33333333,6.114661913; 64.16666667,5.888364216; 65,6.106209821;
        65.83333333,5.898246798; 66.66666667,6.094149177; 67.5,5.909057338;
        68.33333333,6.084943161; 69.16666667,5.920908822; 70,6.071571186;
        70.83333333,5.929749519; 71.66666667,6.065961264; 72.5,5.936330146;
        73.33333333,6.05809181; 74.16666667,5.945655789; 75,6.048417484;
        75.83333333,5.954562979; 76.66666667,6.038998776; 77.5,5.962741783;
        78.33333333,6.033468455; 79.16666667,5.96817076; 80,6.028492443;
        80.83333333,5.97127406; 81.66666667,6.025796857; 82.5,5.973501882;
        83.33333333,6.024218281; 84.16666667,5.978030597; 85,6.016572953;
        85.83333333,5.9836888; 86.66666667,6.01626902; 87.5,5.981625417;
        88.33333333,6.015846632; 89.16666667,5.9851263; 90,6.010834129;
        90.83333333,5.99244256; 91.66666667,6.003220876; 92.5,5.995269275;
        93.33333333,6.003525411; 94.16666667,5.997032884; 95,6.000070151;
        95.83333333,5.998302786; 96.66666667,6.00183925; 97.5,5.996660571;
        98.33333333,6.002105747; 99.16666667,5.997957396; 100,5.999058516;
        100.8333333,5.99946184; 101.6666667,6.000444184; 102.5,5.997008783;
        103.3333333,6.00129346; 104.1666667,5.998878056; 105,5.999213246;
        105.8333333,5.99933418; 106.6666667,6.00059631; 107.5,5.996900304;
        108.3333333,6.001249666; 109.1666667,5.998608796; 110,5.999484921;
        110.8333333,5.998098102; 111.6666667,6.001745914; 112.5,5.996529989;
        113.3333333,6.001870418; 114.1666667,5.997857749; 115,5.99935702;
        115.8333333,5.998655717; 116.6666667,6.001324204; 117.5,5.996971642;
        118.3333333,6.001615999; 119.1666667,5.998167668; 120,5.998049722;
        120.8333333,6.001410537; 121.6666667,5.998350793; 122.5,5.999107172;
        123.3333333,5.999558644; 124.1666667,6.000212381; 125,5.997717298;
        125.8333333,5.998978257; 126.6666667,6.000252326; 127.5,6.00022696],
    extrapolation=Modelica.Blocks.Types.Extrapolation.HoldLastPoint)
    annotation (Placement(transformation(extent={{-62,-130},{-42,-110}})));


  Models.LotkaVolterraWithControl simulatorMPC_y(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start)
    annotation (Placement(transformation(extent={{40,-130},{60,-110}})));
  Models.LotkaVolterraWithControl simulatorNoControl(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start)
    annotation (Placement(transformation(extent={{40,70},{60,90}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-60,70},{-40,90}})));
  Models.LotkaVolterraWithControl simulatorPI_x(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Models.LotkaVolterraWithControl simulatorPI_xy(
    alpha=alpha,
    beta=beta,
    gamma=gamma,
    delta=delta,
    x_start=x_start,
    y_start=y_start)
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  TRANSFORM.Controls.LimPID PID_y1(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=10,
    k_s=1/simulatorPI_y.x_start,
    k_m=1/simulatorPI_y.x_start)
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}})));
  TRANSFORM.Controls.LimPID PID_x1(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=1,
    k_s=1/simulatorPI_y.x_start,
    k_m=1/simulatorPI_y.x_start)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
equation
  connect(setpoint_y.y, PID_y.u_s)
    annotation (Line(points={{-39,40},{-12,40}}, color={0,0,127}));
  connect(setpoint_x.y, PID_x.u_s)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  connect(const.y, simulatorNoControl.u_x) annotation (Line(points={{-39,80},{30,
          80},{30,84},{38,84}}, color={0,0,127}));
  connect(const.y, simulatorNoControl.u_y) annotation (Line(points={{-39,80},{30,
          80},{30,76},{38,76}}, color={0,0,127}));
  connect(PID_y.y, simulatorPI_y.u_y) annotation (Line(points={{11,40},{28,40},{
          28,36},{38,36}}, color={0,0,127}));
  connect(simulatorPI_y.y, PID_y.u_m) annotation (Line(points={{61,36},{70,36},{
          70,20},{0,20},{0,28}}, color={0,0,127}));
  connect(simulatorPI_x.x, PID_x.u_m) annotation (Line(points={{61,4},{70,4},{70,
          -20},{0,-20},{0,-12}}, color={0,0,127}));
  connect(PID_x.y, simulatorPI_x.u_x)
    annotation (Line(points={{11,0},{28,0},{28,4},{38,4}}, color={0,0,127}));
  connect(setpoint_x.y, PID_x1.u_s) annotation (Line(points={{-39,0},{-24,0},{-24,
          -40},{-12,-40}}, color={0,0,127}));
  connect(simulatorPI_xy.x, PID_x1.u_m) annotation (Line(points={{61,-66},{70,-66},
          {70,-56},{0,-56},{0,-52}}, color={0,0,127}));
  connect(simulatorPI_xy.y, PID_y1.u_m) annotation (Line(points={{61,-74},{70,-74},
          {70,-100},{0,-100},{0,-92}}, color={0,0,127}));
  connect(PID_y1.y, simulatorPI_xy.u_y) annotation (Line(points={{11,-80},{26,-80},
          {26,-74},{38,-74}}, color={0,0,127}));
  connect(PID_x1.y, simulatorPI_xy.u_x) annotation (Line(points={{11,-40},{26,-40},
          {26,-66},{38,-66}}, color={0,0,127}));
  connect(setpoint_y.y, PID_y1.u_s) annotation (Line(points={{-39,40},{-28,40},{
          -28,-80},{-12,-80}}, color={0,0,127}));
  connect(combiTimeTable1.y[1], simulatorMPC_y.u_y) annotation (Line(points={{-41,
          -120},{-38,-120},{-38,-124},{38,-124}}, color={0,0,127}));
  connect(const.y, simulatorPI_y.u_x) annotation (Line(points={{-39,80},{20,80},
          {20,44},{38,44}}, color={0,0,127}));
  connect(simulatorPI_x.u_y, simulatorPI_y.u_x) annotation (Line(points={{38,-4},
          {20,-4},{20,44},{38,44}}, color={0,0,127}));
  connect(simulatorMPC_y.u_x, simulatorPI_y.u_x) annotation (Line(points={{38,-116},
          {20,-116},{20,44},{38,44}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-160},{100,100}})),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-160},{100,
            100}})),
    experiment(StopTime=50, __Dymola_Algorithm="Dassl"));
end Test_LotkaVolterraMPC;
