"""Random play script after a fixed menu prefix: mkinput2.py seed prefix.txt start_frame total_frames"""
import sys, random
seed, prefix, f, frames = int(sys.argv[1]), sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
random.seed(seed)
out = open(prefix).read().strip().splitlines()
while f < frames:
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
    if random.random() < 0.03:  # weapon menu: open, pick something, close
        out.append("%d 4 S" % f)
        out.append("%d 4 %s" % (f + 40, random.choice("UDLR")))
        out.append("%d 4 S" % (f + 80))
        f += 100
    f += dur
print("\n".join(out))
