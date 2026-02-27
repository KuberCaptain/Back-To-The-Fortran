# Task 02 — The Relativistic Passport

A spaceship is traveling at **v = 0.87c** (87% the speed of light).
On board is astronaut John Smith.

Given:
- Rest mass of John: **m₀ = 80 kg**
- Ship's rest length: **L₀ = 120 m**
- Onboard flight duration: **τ = 10 years**

## Task

Calculate and print the ship's relativistic passport:

1. Lorentz factor γ
2. Relativistic mass of John Smith
3. Length of the ship as observed from Earth
4. How many years passed on Earth during the flight

## Formulas

```
γ = 1 / sqrt(1 - v²/c²)
m = γ * m₀
L = L₀ / γ
t = γ * τ
```

## Expected Output Format

```
=== RELATIVISTIC PASSPORT ===
Velocity:            0.870 c
Lorentz factor:      2.028
Rest mass:          80.000 kg
Relativistic mass: 162.221 kg
Ship length:        59.160 m
Earth time elapsed: 20.280 years
=============================
```

## What to learn

- `REAL(8)` for double precision
- `SQRT()` intrinsic function
- `WRITE` with format strings: `A`, `F7.3`, `T` (tab to column)
- Named constants with `PARAMETER`

## Compile & Run

```bash
gfortran solution.f90 -o solution
./solution
```
