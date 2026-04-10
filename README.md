# Back To The Fortran

> "Real programmers don't use Pascal. Real programmers use FORTRAN."
> — Ed Post, 1982

Welcome to 1957. No OOP. No frameworks. No package manager crying about peer dependencies. Just you, the compiler, and a language that's older than most of your relatives — and still flies your airplanes.

This is a personal learning project. Each folder is one task, one solution. Solve problems, sharpen logic, pick up Fortran along the way. No rush. Real programmers had to wait overnight for their punch cards to come back.

---

## Project Structure

```
Back-To-The-Fortran/
├── README.md
├── task-01-hello-world/
│   ├── README.md        ← problem statement
│   └── solution.f90     ← working solution
├── task-02-variables/
│   ├── README.md
│   └── solution.f90
└── ...
```

Each task folder contains:
- `README.md` — what to do and what to expect
- `solution.f90` — a working Fortran solution (free-form source)

---

## Task Tracker

| # | Task | Topic | Status |
|---|------|-------|--------|
| 01 | Hello, World! | Program structure, output | ✅ |
| 02 | The Relativistic Passport | REAL(8), SQRT, formatted WRITE | ✅ |
| 03 | Kerosene Ballistics | COS/SIN, PARAMETER, T-tab format | ✅ |
| 04 | The Atmospheric Probe | IF/ELSE IF, READ, STOP, EXP, TRIM | ✅ |
| 05 | The Fibonacci-Rutherford Chain Reaction | DO WHILE, INTEGER(8), DBLE, T-tab | ✅ |
| 06 | The Splendor and Misery of Flat Surfaces | Arrays, Lambertian shading, ADVANCE='NO' | ✅ |
| 07 | Subroutines | SUBROUTINE, CALL | ⬜ |
| 08 | Functions | FUNCTION, RETURN | ⬜ |
| 09 | Modules | MODULE, USE | ⬜ |
| 10 | File I/O | OPEN, READ, WRITE, CLOSE | ⬜ |

> ⬜ not started &nbsp;|&nbsp; 🔧 in progress &nbsp;|&nbsp; ✅ done

---

## Getting Started

You need a Fortran compiler. [GFortran](https://gcc.gnu.org/fortran/) is the standard free option — no punch card reader required.

```bash
# Ubuntu / Debian
sudo apt install gfortran

# macOS
brew install gcc
```

Compile and run a solution:

```bash
cd task-01-hello-world
gfortran solution.f90 -o solution
./solution
```

If it runs — congratulations. You now share a toolchain with people who calculated rocket trajectories in the 1960s.
