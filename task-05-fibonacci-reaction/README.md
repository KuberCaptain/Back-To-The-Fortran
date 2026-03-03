# Task 05 — The Fibonacci-Rutherford Chain Reaction

> "An atom split without counting the iterations first is not physics — it is hooliganism."
> — Kuzma Prutkov, Nuclear Physicist

Ernest Rutherford bombarded gold foil with alpha particles in 1911. But what if every reflected
particle spawned new ones following Fibonacci's law, and the reaction halted only when it crossed
a critical-mass threshold?

Simulate the chain reaction and find the moment it goes out of control.

---

## Physics Model

The reactor starts with a single alpha particle. At each step:

| Quantity | Formula |
|----------|---------|
| Particles at step *n* | Fibonacci: `P(n) = P(n-1) + P(n-2)`, with `P(1)=P(2)=1` |
| Energy per particle | `E(n) = E₀ / n²`, where `E₀ = 1000 MeV` |
| Total energy | `E_total(n) = P(n) × E(n)` |

**Stopping condition** — the loop runs while:
```
step ≤ 30  AND  E_total ≤ 50 000 MeV
```
The reaction exits the moment **either** limit is breached.

**Outcome:**
- `MELTDOWN` — energy exceeded 50 000 MeV before step 30
- `CONTROLLED` — the reaction stayed within bounds through all 30 steps

---

## Expected Output

```
=== RUTHERFORD CHAIN REACTION ===
Step   Particles     E(n) MeV        E_total MeV     Status
-----------------------------------------------------------
   1            1        1000.000        1000.000    stable
   2            1         250.000         250.000    stable
   3            2         111.111         222.222    stable
   4            3          62.500         187.500    stable
   5            5          40.000         200.000    stable
   6            8          27.778         222.222    stable
   7           13          20.408         265.306    stable
   8           21          15.625         328.125    stable
   9           34          12.346         419.753    stable
  10           55          10.000         550.000    stable
  ...
  23        28657           1.890       54172.023    CRITICAL
-----------------------------------------------------------
=== REACTION SUMMARY ===
Total steps:                   23
Max particles:                  28657
Peak energy:                54172.023 MeV
Outcome:                   MELTDOWN
=================================
```

---

## Physical Background

**Fibonacci in nature** — spirals of shells, sunflower seed arrangements, and branching
patterns all follow Fibonacci numbers. Nature uses this sequence to optimise packing density;
it is not coincidence.

**Real reactor control** — chain reactions in actual reactors are halted by boron and cadmium
control rods that absorb neutrons. Without them the reaction goes supercritical — as at Chernobyl.

**Energy law E₀/n²** — a simplified Coulomb model: the further a particle travels from the
nucleus, the lower the interaction energy. The square in the denominator comes from the geometry
of three-dimensional space (inverse-square law).

---

## What to learn

- `DO WHILE` with a compound `.AND.` condition — the loop body executes only while **both** guards hold
- `INTEGER(8)` — 64-bit integers for large Fibonacci numbers that overflow 32-bit
- `DBLE()` — explicit conversion from integer to double precision before arithmetic
- Tab descriptors `T8`, `T22`, `T38`, `T54` — column alignment in formatted `WRITE`
- Tracking peak values inside the loop (`peak_energy`, `max_particles`)
- Post-loop outcome branching: compare `final_step` against `MAX_STEP`

---

## Compile & Run

```bash
gfortran solution.f90 -o solution
./solution
```
