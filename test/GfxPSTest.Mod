MODULE GfxPSTest;  (** GfxPSTest.Run: a rectangle drawn into a PostScript file with GfxPS; needs the desktop's display *)

IMPORT Files, Gfx, GfxPS, Out := out;

VAR fails, checks: LONGINT;

PROCEDURE Check(what: ARRAY OF CHAR; ok: BOOLEAN);
BEGIN
  INC(checks);
  IF ~ok THEN INC(fails); Out.String("FAIL "); Out.String(what); Out.Ln END
END Check;

PROCEDURE Run*;
VAR psc: GfxPS.Context; f: Files.File; R: Files.Rider; s: ARRAY 4 OF CHAR;
BEGIN
  fails := 0; checks := 0;
  NEW(psc); GfxPS.Init(psc, FALSE, FALSE, 595, 842, 0, 0, 0, 0, 300);
  f := Files.New("zq_test.ps"); GfxPS.Open(psc, f);
  Gfx.SetFillColor(psc, Gfx.Red); Gfx.DrawRect(psc, 10, 10, 100, 50, {Gfx.Fill});
  GfxPS.ShowPage(psc); GfxPS.Close(psc); Files.Register(f);
  f := Files.Old("zq_test.ps"); Check("zq_test.ps written", (f # NIL) & (Files.Length(f) > 100));
  IF f # NIL THEN Files.Set(R, f, 0); Files.ReadBytes(R, s, 2); Check("it begins with %!", (s[0] = "%") & (s[1] = "!")) END;
  Out.String("GfxPSTest: "); Out.Int(checks, 0); Out.String(" checks, "); Out.Int(fails, 0); Out.String(" failed"); Out.Ln
END Run;

END GfxPSTest.
