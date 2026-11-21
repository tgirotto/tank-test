model LowerTank
  parameter Real A = 2.0 "Tank area [m2]";
  parameter Real Cd = 0.003 "Demand draw coefficient [m2.5/s]";
  parameter Real h0 = 1.0 "Initial level [m]";
  input Real q_in "Inflow from upper tank [m3/s]";
  output Real h_l(start = h0, fixed = true) "Level [m]";
  output Real q_draw "Demand draw [m3/s]";
equation
  q_draw = Cd * sqrt(max(h_l, 0));
  A * der(h_l) = q_in - q_draw;
end LowerTank;
