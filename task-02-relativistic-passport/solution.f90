PROGRAM relativistic_passport
  IMPLICIT NONE

  REAL(8), PARAMETER :: v_over_c = 0.87D0
  REAL(8), PARAMETER :: m0       = 80.0D0
  REAL(8), PARAMETER :: L0       = 120.0D0
  REAL(8), PARAMETER :: tau      = 10.0D0

  REAL(8) :: gamma, m_rel, L, t_earth

  gamma   = 1.0D0 / SQRT(1.0D0 - v_over_c**2)
  m_rel   = gamma * m0
  L       = L0 / gamma
  t_earth = gamma * tau

  WRITE(*, '(A)')              "=== RELATIVISTIC PASSPORT ==="
  WRITE(*, '(A, T20, F7.3, A)') "Velocity:",           v_over_c, " c"
  WRITE(*, '(A, T20, F7.3)')    "Lorentz factor:",      gamma
  WRITE(*, '(A, T20, F7.3, A)') "Rest mass:",           m0,       " kg"
  WRITE(*, '(A, T20, F7.3, A)') "Relativistic mass:",   m_rel,    " kg"
  WRITE(*, '(A, T20, F7.3, A)') "Ship length:",         L,        " m"
  WRITE(*, '(A, T20, F7.3, A)') "Earth time elapsed:",  t_earth,  " years"
  WRITE(*, '(A)')              "============================="

END PROGRAM relativistic_passport
