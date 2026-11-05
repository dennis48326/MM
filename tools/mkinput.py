"""Random-ish play script: navigate menus then run/jump/shoot."""
import sys, random
seed = int(sys.argv[1]); stage_dirs = sys.argv[2]; frames = int(sys.argv[3])
random.seed(seed)
out = ["200 5 S"]
f = 330
for d in stage_dirs:
    if d != '-':
        out.append("%d 4 %s" % (f, d)); f += 20
out.append("%d 5 S" % (f + 20)); f += 400
while f < frames:
    r = random.random()
    dur = random.randint(10, 90)
    mv = random.choice("RRRRRLU D")
    if mv != ' ':
        out.append("%d %d %s" % (f, dur, mv))
    t = f
    while t < f + dur:
        if random.random() < 0.5:
            out.append("%d %d A" % (t, random.randint(5, 30)))
        if random.random() < 0.6:
            out.append("%d 3 B" % (t + random.randint(0, 10)))
        t += random.randint(8, 30)
    if random.random() < 0.02:
        out.append("%d 4 S" % f)  # pause menu
        out.append("%d 4 S" % (f + 60))
    f += dur
print("\n".join(out))
