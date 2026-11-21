model UpperTank
  parameter Real A = 1.0 "Tank area [m2]";
  parameter Real Cd = 0.004 "Outlet coefficient [m2.5/s]";
  parameter Real h0 = 1.0 "Initial level [m]";
  input Real q_pump "Pump inflow [m3/s]";
  output Real h_u(start = h0, fixed = true) "Level [m]";
  output Real q_out "Outflow to lower tank [m3/s]";
equation
  q_out = Cd * sqrt(max(h_u, 0));
  A * der(h_u) = q_pump - q_out;
end UpperTank;
