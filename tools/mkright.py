"""Go-right test bot after a menu prefix: mkright.py seed prefix.txt start_frame total_frames
(holds Right, jumps and shoots; used to test the widescreen level providers)"""
import sys, random
seed, prefix, f, frames = int(sys.argv[1]), sys.argv[2], int(sys.argv[3]), int(sys.argv[4])
random.seed(seed)
out = open(prefix).read().strip().splitlines()
out.append("%d %d R" % (f, frames - f))
t = f
while t < frames:
    out.append("%d %d A" % (t, random.randint(8, 30)))
    for k in range(0, 40, 6): out.append("%d 2 B" % (t + k))
    if random.random() < 0.15: out.append("%d %d U" % (t, 30))
    t += random.randint(30, 60)
print("\n".join(out))
