PROGRAM fibonacci_reaction
  IMPLICIT NONE

  REAL(8),    PARAMETER :: E0       = 1000.0D0    ! MeV, initial particle energy
  REAL(8),    PARAMETER :: E_CRIT   = 50000.0D0   ! MeV, critical mass threshold
  INTEGER,    PARAMETER :: MAX_STEP = 30           ! maximum allowed step

  INTEGER(8) :: fib_prev, fib_curr, fib_next
  INTEGER(8) :: particles
  INTEGER    :: step
  REAL(8)    :: e_n, e_total
  REAL(8)    :: peak_energy
  INTEGER(8) :: max_particles
  INTEGER    :: final_step
  CHARACTER(8) :: status

  ! --- Initialise Fibonacci seed: F(1)=1, F(2)=1 ---
  fib_prev = 1
  fib_curr = 0
  e_total  = 0.0D0
  step     = 1

  WRITE(*, '(A)') "=== RUTHERFORD CHAIN REACTION ==="
  WRITE(*, '(A, T8, A, T22, A, T38, A, T54, A)') &
       "Step", "Particles", "E(n) MeV", "E_total MeV", "Status"
  WRITE(*, '(A)') "-----------------------------------------------------------"

  DO WHILE (step <= MAX_STEP .AND. e_total <= E_CRIT)

    ! Advance Fibonacci sequence
    fib_next = fib_prev + fib_curr
    fib_prev = fib_curr
    fib_curr = fib_next
    particles = fib_curr

    ! Compute energies for this step
    e_n     = E0 / DBLE(step * step)
    e_total = DBLE(particles) * e_n

    ! Track peak values
    peak_energy   = e_total
    max_particles = particles
    final_step    = step

    ! Determine row status
    IF (e_total > E_CRIT) THEN
      status = "CRITICAL"
    ELSE
      status = "stable"
    END IF

    WRITE(*, '(I4, T8, I10, T22, F12.3, T38, F12.3, T54, A)') &
         step, particles, e_n, e_total, TRIM(status)

    step = step + 1

  END DO

  WRITE(*, '(A)') "-----------------------------------------------------------"

  WRITE(*, '(A)') "=== REACTION SUMMARY ==="
  WRITE(*, '(A, T28, I6)')    "Total steps:",   final_step
  WRITE(*, '(A, T28, I10)')   "Max particles:", max_particles
  WRITE(*, '(A, T28, F10.3, A)') "Peak energy:", peak_energy, " MeV"

  IF (final_step < MAX_STEP) THEN
    WRITE(*, '(A, T28, A)')  "Outcome:", "MELTDOWN"
  ELSE
    WRITE(*, '(A, T28, A)')  "Outcome:", "CONTROLLED"
  END IF

  WRITE(*, '(A)') "================================="

END PROGRAM fibonacci_reaction
