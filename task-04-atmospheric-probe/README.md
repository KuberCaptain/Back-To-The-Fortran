# Task 04 — The Atmospheric Probe

> "Air is what those breathe who do not know the formula for the Standard Atmosphere."
> — Kuzma Prutkov, Amateur Meteorologist

A weather balloon is ascending. The atmosphere is layered, each layer with its own
temperature behavior. Given an altitude, determine which layer the probe is in,
calculate atmospheric conditions, and print a passport.

---

## ISA Model (International Standard Atmosphere)

| Layer | Altitude | Name | Temperature |
|-------|----------|------|-------------|
| 1 | 0 – 11,000 m | Troposphere | Decreases 6.5 °C/km |
| 2 | 11,000 – 20,000 m | Lower Stratosphere | Constant −56.5 °C |
| 3 | 20,000 – 32,000 m | Upper Stratosphere | Increases 1.0 °C/km |
| 4 | > 32,000 m | Mesosphere | Beyond model limits |

---

## Formulas

**Temperature:**
```
Troposphere:        T = 15.0 - 0.0065 * h
Lower Stratosphere: T = -56.5
Upper Stratosphere: T = -56.5 + 0.001 * (h - 20000)
```

**Pressure:**
```
Troposphere:        P = P0 * (1 - L*h / T0)^(g*M / R*L)
Lower Stratosphere: P = P11 * exp(-g*M*(h-11000) / R*T_strat)
Upper Stratosphere: P = P20 * (T_strat / T_K)^(g*M / R*L_upper)
```

Constants: `P0=101325 Pa`, `T0=288.15 K`, `L=0.0065 K/m`, `g=9.80665 m/s²`,
`M=0.0289644 kg/mol`, `R=8.31446 J/mol·K`, `P11=22632.1 Pa`, `P20=5474.9 Pa`

**Status message:**
```
T < -50 °C  → "Extreme Cold: Lubricants may freeze!"
T ≥  0 °C  → "Thaw: Potential sensor condensation."
otherwise   → "Normal Operating Conditions."
```

---

## Sample Outputs

**h = 5000 m (Troposphere)**
```
Enter altitude (m):
5000
========== ATMOSPHERIC PASSPORT ==========
Altitude:               5000.0 m
Layer:                  Troposphere
Temp (C):                -17.50 deg C
Temp (K):                255.65 K
Pressure:             54019.91 Pa
------------------------------------------
Status: Normal Operating Conditions.
==========================================
```

**h = 15000 m (Lower Stratosphere)**
```
Enter altitude (m):
15000
========== ATMOSPHERIC PASSPORT ==========
Altitude:              15000.0 m
Layer:                  Lower Stratosphere
Temp (C):                -56.50 deg C
Temp (K):                216.65 K
Pressure:             12044.57 Pa
------------------------------------------
Status: Extreme Cold: Lubricants may freeze!
==========================================
```

**h = 50000 m (Beyond model)**
```
Enter altitude (m):
50000
========== ATMOSPHERIC PASSPORT ==========
Altitude:              50000.0 m
Layer:                  Mesosphere
------------------------------------------
WARNING: Probe has left the reliable zone.
ISA model is not valid above 32,000 m.
==========================================
```

---

## What to learn

- `READ(*, *)` — reading user input
- `IF / ELSE IF / ELSE / END IF` — multi-branch logic
- `STOP` — early program termination
- `EXP()` — exponential intrinsic function
- `TRIM()` — strip trailing spaces from a CHARACTER variable
- `CHARACTER(n)` — fixed-length string variables
- `PARAMETER` expressions computed from other `PARAMETER`s

---

## Compile & Run

```bash
gfortran solution.f90 -o solution
./solution
```
