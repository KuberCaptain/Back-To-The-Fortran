# Task 03 — Kerosene Ballistics

A Soviet D-30 howitzer fires a shot. A shell leaves the barrel and physics takes over.

Given:
- Shell mass: **m = 21.76 kg**
- Muzzle velocity: **v₀ = 690 m/s**
- Launch angle: **α = 45°**
- Gravity: **g = 9.81 m/s²**

## Task

Calculate and print the ballistic passport of the shot:

1. Horizontal and vertical velocity components
2. Maximum trajectory height
3. Total flight time
4. Firing range
5. Kinetic energy at the moment of impact

## Formulas

```
vx = v₀ × cos(α)
vy = v₀ × sin(α)

H      = vy² / (2 × g)
T      = 2 × vy / g
R      = vx × T
Ek     = m × v₀² / 2
```

> **Why is Ek at impact equal to the initial Ek?**
> This model has no air resistance. The shell returns to the same height it was
> launched from, so all potential energy converts back to kinetic energy.
> Total mechanical energy is conserved.

## Expected Output Format

```
====== BALLISTIC PASSPORT — D-30 HOWITZER ======
Mass:                          21.760 kg
Muzzle velocity:              690.000 m/s
Launch angle:                  45.000 deg
------------------------------------------------
Horizontal velocity (Vx):     487.908 m/s
Vertical velocity   (Vy):     487.908 m/s
Maximum height:             12133.000 m
Flight time:                   99.471 s
Firing range:               48532.102 m
Kinetic energy:              5179.968 kJ
================================================
```

## What to learn

- `PARAMETER` for constants (PI, g)
- `COS()` / `SIN()` — work in radians, so convert degrees first
- `T32` tab format descriptor for column alignment with varying label lengths
- `F10.3` format for wider numbers

## Compile & Run

```bash
gfortran solution.f90 -o solution
./solution
```
