model Pump
  parameter Real qmax = 0.02 "Max flow [m3/s]";
  parameter Real tau = 5 "Time constant [s]";
  input Real u "Command 0..1";
  output Real q(start = 0, fixed = true) "Flow [m3/s]";
equation
  tau * der(q) = qmax * min(max(u, 0), 1) - q;
end Pump;
