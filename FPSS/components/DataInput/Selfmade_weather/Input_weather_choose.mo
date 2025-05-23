within FPSS.components.DataInput.Selfmade_weather;
model Input_weather_choose

  parameter Real DeltaT = 0 "To modify the ambient temperature";

  replaceable parameter weatherfiles.weather_base_const input_weather constrainedby weatherfiles.weather_base_const annotation(choicesAllMatching = true);

  Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(
    fileName=Modelica.Utilities.Files.loadResource(input_weather.filename),      tableName = "tab", tableOnFile = true,columns=1:2)                                                                                                                                                                                      annotation (
    Placement(transformation(origin = {-86, 0}, extent = {{-10, -10}, {10, 10}})));

  Modelica.Blocks.Interfaces.RealOutput T_amb(unit="K") annotation (
    Placement(transformation(origin={110,60},     extent = {{-10, -10}, {10, 10}}), iconTransformation(origin={110,60},    extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Celsius.ToKelvin toKelvin2 annotation (
    Placement(transformation(origin={84,60},     extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput T_amb_mod(unit="K") annotation (
      Placement(transformation(origin={110,-60},extent={{-10,-10},{10,10}}),
        iconTransformation(origin={110,-60},extent={{-10,-10},{10,10}})));
  T_amb_modifier t_amb_modifier(DeltaT=DeltaT)
    annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
equation
  connect(toKelvin2.Kelvin, T_amb) annotation (
    Line(points={{95,60},{110,60}},        color = {0, 0, 127}));
  connect(t_amb_modifier.T_amb_modified, T_amb_mod)
    annotation (Line(points={{91,-60},{110,-60}},
                                                color={0,0,127}));
  connect(combiTimeTable.y[2], toKelvin2.Celsius) annotation (Line(points={{-75,0},
          {0,0},{0,60},{72,60}},      color={0,0,127}));
  connect(combiTimeTable.y[2], t_amb_modifier.T_amb_original)
    annotation (Line(points={{-75,0},{0,0},{0,-60},{68,-60}},
                                                            color={0,0,127}));
  annotation (
    Icon(graphics={  Rectangle(origin = {-30, 0}, extent = {{-70, 100}, {70, -100}}), Line(origin = {-80, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-60, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-40, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {20, 0}, points = {{0, 100}, {0, -100}, {0, -100}}), Line(origin = {-30, 80}, points = {{-70, 0}, {70, 0}, {70, 0}}), Text(origin={-30,-7},     extent={{-68,73},
              {68,-73}},
          textColor={0,0,0},
          textString="weather
",        textStyle={TextStyle.Bold}),                                                                                                                                                                                                        Line(origin={70,55},    points={{-30,-55},
              {10,-55},{10,5},{22,5},{30,5}}),                                                                                                                                                                                                        Line(origin={89.6636,
              -60.4805},                                                                                                                                                                                                        points = {{-10, 0}, {10, 0}, {10, 0}}),
        Line(points={{80,-60},{80,0}}, color={0,0,0})}), Documentation(info="<html>
<p>Model for weather data input</p>
</html>"));
end Input_weather_choose;
