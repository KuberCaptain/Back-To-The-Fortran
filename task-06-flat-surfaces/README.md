# Task 06 — The Splendor and Misery of Flat Surfaces

> "If you see an inscription of a 'Buffalo' on an Elephant's cage — do not believe your eyes."
> — Kuzma Prutkov, Computer Graphics Pioneer

A flat polygon only appears voluminous when the shadows upon it obey the laws of nature.
We shall calculate the brightness of each point on a surface, so that the human eye may be
deceived with the utmost respect.

---

## Model

Imagine the screen as a 10×10 grid. Each cell has a **surface normal** — a unit vector
perpendicular to the surface at that point. Together they form a convex **hill**:

- At the centre the normal points straight up: `(0, 0, 1)`
- Toward the edges it gradually leans outward

A single unit **light vector** `L` represents the direction the light comes from.
For each cell the **Lambertian intensity** is:

```
I = max(0.0, N · L)
```

Where `N · L` is the dot product of the surface normal and the light vector.
The result is stored in a 10×10 intensity matrix and rendered as ASCII art.

---

## Geometry

**Normal construction** for grid cell `(i, j)`, indices 1..10, centre at 5.5:

```
dx =  (j - 5.5) / 4.5        ! -1..+1, left → right
dy = -(i - 5.5) / 4.5        ! -1..+1, bottom → top

nx_raw = dx * TILT
ny_raw = dy * TILT
nz_raw = 1.0

N = (nx_raw, ny_raw, nz_raw) / ||(nx_raw, ny_raw, nz_raw)||
```

`TILT = 1.5` controls how steeply the hill slopes at its edges.

**Light vector** — upper-right direction, normalised:

```
L = (1, 1, 1) / sqrt(3)  ≈  (0.577, 0.577, 0.577)
```

---

## ASCII Palette

| Intensity range | Character | Meaning |
|-----------------|-----------|---------|
| I ≥ 0.80 | `@` | Full light |
| 0.60 ≤ I < 0.80 | `#` | Bright |
| 0.40 ≤ I < 0.60 | `*` | Mid tone |
| 0.15 ≤ I < 0.40 | `.` | Dim |
| I < 0.15 | ` ` | Shadow |

Each character is printed twice to compensate for the terminal's aspect ratio
(characters are taller than they are wide).

---

## Expected Output

```
======== THE SPLENDOR AND MISERY OF FLAT SURFACES ========
  Lambertian shading  |  Light direction: upper-right (1,1,1)
------------------------------------------------------------
@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@##
@@@@@@@@@@@@@@@@####
####@@@@@@@@@@######
######@@@@@@########
########@@##########
##########**********
************........
....................
                    
------------------------------------------------------------
  Legend:  ' ' < 0.15 < '.' < 0.40 < '*' < 0.60 < '#' < 0.80 < '@'
============================================================
```

The bright corner is upper-right (where `L` points). The shadow falls lower-left.

---

## What to learn

- `REAL(8) :: array(N, N, 3)` — 3D arrays for storing vectors per grid cell
- `DO i = 1, N` / `DO j = 1, N` — nested loops over a 2D grid
- `SQRT`, manual vector normalisation
- `MAX(0.0D0, dot)` — clamping negative intensities to zero
- `WRITE(*, '(...)', ADVANCE='NO')` — printing without a newline to build rows
- `WRITE(*, *)` — flushing the line at end of each row

---

## Compile & Run

```bash
gfortran solution.f90 -o solution
./solution
```
