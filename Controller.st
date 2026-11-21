PROGRAM Controller
  VAR
    h_l AT %ID0 : REAL;
    h_u AT %ID1 : REAL;
    u AT %QD0 : REAL;
    running : BOOL := FALSE;
  END_VAR
  VAR_INPUT
  END_VAR

  IF h_l < 0.8 THEN
    running := TRUE;
  ELSIF h_l > 1.6 THEN
    running := FALSE;
  END_IF;

  IF h_u > 2.5 THEN
    running := FALSE;
  END_IF;

  IF running THEN
    u := 1.0;
  ELSE
    u := 0.0;
  END_IF;
END_PROGRAM

CONFIGURATION Config0
  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#100ms, PRIORITY := 0);
    PROGRAM instance0 WITH task0 : Controller;
  END_RESOURCE
END_CONFIGURATION
