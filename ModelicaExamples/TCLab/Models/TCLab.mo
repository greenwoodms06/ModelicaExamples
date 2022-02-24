within ModelicaExamples.TCLab.Models;
model TCLab

  parameter BaseClasses.RecordVolume pV1(V=4.2e-7,d=2329,cp=740) annotation (Dialog(group="Volume"));
  parameter BaseClasses.RecordVolume pV2(V=4.2e-7,d=2329,cp=740) annotation (Dialog(group="Volume"));

  parameter SI.Power Q1_scale=0.01 annotation (Dialog(group="Volume"));
  parameter SI.Power Q2_scale=0.01 annotation (Dialog(group="Volume"));

  parameter SI.Length L=0.01 "Wall thickness parallel to heat flow"
    annotation (Dialog(group="Conduction"));
  parameter SI.Area crossArea=0.001
    "Cross-sectional area perpindicular to heat flow"
    annotation (Dialog(group="Conduction"));
  parameter SI.ThermalConductivity lambda=0.0001 "Thermal conductivity"
    annotation (Dialog(group="Conduction"));

  parameter SI.CoefficientOfHeatTransfer alpha1=75
    "Convection heat transfer coefficient"
    annotation (Dialog(group="Convection"));
  parameter SI.CoefficientOfHeatTransfer alpha2=75
    "Convection heat transfer coefficient"
    annotation (Dialog(group="Convection"));
  parameter SI.Area surfaceArea1=6*pV1.V^(2/3) "Heat transfer surface area"
    annotation (Dialog(group="Convection"));
  parameter SI.Area surfaceArea2=6*pV2.V^(2/3) "Heat transfer surface area"
    annotation (Dialog(group="Convection"));

protected
  TRANSFORM.HeatAndMassTransfer.Volumes.UnitVolume V1(
    T_start=pV1.T_start,
    V=pV1.V,
    d=pV1.d,
    cp=pV1.cp,
    Q_gen=Q1*Q1_scale)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  TRANSFORM.HeatAndMassTransfer.Resistances.Heat.Convection convection1(
      surfaceArea=surfaceArea1, alpha=alpha1)
    annotation (Placement(transformation(extent={{-70,-10},{-50,10}})));
  TRANSFORM.HeatAndMassTransfer.BoundaryConditions.Heat.Temperature boundary1
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  TRANSFORM.HeatAndMassTransfer.Resistances.Heat.Plane plane(
    L=L,
    crossArea=crossArea,
    lambda=lambda)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  TRANSFORM.HeatAndMassTransfer.Volumes.UnitVolume V2(
    T_start=pV2.T_start,
    V=pV2.V,
    d=pV2.d,
    cp=pV2.cp,
    Q_gen=Q2*Q2_scale)
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  TRANSFORM.HeatAndMassTransfer.Resistances.Heat.Convection convection2(
      surfaceArea=surfaceArea2, alpha=alpha2)
    annotation (Placement(transformation(extent={{70,-10},{50,10}})));
  TRANSFORM.HeatAndMassTransfer.BoundaryConditions.Heat.Temperature boundary2
    annotation (Placement(transformation(extent={{100,-10},{80,10}})));
public
  Modelica.Blocks.Interfaces.RealInput Q1
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealInput Q2
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealOutput T1
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput T2
    annotation (Placement(transformation(extent={{100,-70},{120,-50}})));

equation
  T1 = V1.T;
  T2 = V2.T;

  connect(boundary1.port, convection1.port_a)
    annotation (Line(points={{-80,0},{-67,0}}, color={191,0,0}));
  connect(convection1.port_b, V1.port)
    annotation (Line(points={{-53,0},{-30,0}}, color={191,0,0}));
  connect(V1.port, plane.port_a)
    annotation (Line(points={{-30,0},{-7,0}}, color={191,0,0}));
  connect(V2.port, plane.port_b)
    annotation (Line(points={{30,0},{7,0}}, color={191,0,0}));
  connect(convection2.port_b, V2.port)
    annotation (Line(points={{53,0},{30,0}}, color={191,0,0}));
  connect(convection2.port_a, boundary2.port)
    annotation (Line(points={{67,0},{80,0}}, color={191,0,0}));
  annotation (experiment(StopTime=60, __Dymola_Algorithm="Dassl"));
end TCLab;
