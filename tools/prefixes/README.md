Controller-input prefixes that get from power-on to a stage, for `tools/mkinput2.py`.
Format per line: `start_frame duration buttons` (A B s=Select S=Start U D L R).

- `mm1_stageN.txt`: Mega Man; N presses of Right on stage select (0 Cut, 1 Guts, 2 Ice, 3 Bomb, 4 Fire, 5 Elec).
  Random play starts at frame ~800.
- `mmK_DIR.txt` (K = 2..6): stage-select cursor direction from the centre (U, UR, R, DR, D, DL, L, UL).
  Random play from frame 1500 (MM2) or 1300/1400 (MM3-6).
- `mm2_wily_password.txt`: enters the all-bosses password; Wily stage 1 starts around frame 3700.

Example: `python3 tools/mkinput2.py 42 tools/prefixes/mm3_UR.txt 1300 20000 > play.txt`
