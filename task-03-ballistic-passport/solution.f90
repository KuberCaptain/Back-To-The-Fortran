PROGRAM ballistic_passport
  IMPLICIT NONE

  REAL(8), PARAMETER :: PI    = 3.141592653589793D0
  REAL(8), PARAMETER :: g     = 9.81D0
  REAL(8), PARAMETER :: m     = 21.76D0
  REAL(8), PARAMETER :: v0    = 690.0D0
  REAL(8), PARAMETER :: alpha = 45.0D0  ! degrees

  REAL(8) :: alpha_rad, vx, vy, H, T_fly, R, Ek

  alpha_rad = alpha * PI / 180.0D0

  vx    = v0 * COS(alpha_rad)
  vy    = v0 * SIN(alpha_rad)
  H     = vy**2 / (2.0D0 * g)
  T_fly = 2.0D0 * vy / g
  R     = vx * T_fly
  Ek    = m * v0**2 / 2.0D0

  WRITE(*, '(A)') "====== BALLISTIC PASSPORT — D-30 HOWITZER ======"
  WRITE(*, '(A, T32, F10.3, A)') "Mass:",                    m,            " kg"
  WRITE(*, '(A, T32, F10.3, A)') "Muzzle velocity:",         v0,           " m/s"
  WRITE(*, '(A, T32, F10.3, A)') "Launch angle:",            alpha,        " deg"
  WRITE(*, '(A)')                 "------------------------------------------------"
  WRITE(*, '(A, T32, F10.3, A)') "Horizontal velocity (Vx):", vx,          " m/s"
  WRITE(*, '(A, T32, F10.3, A)') "Vertical velocity   (Vy):", vy,          " m/s"
  WRITE(*, '(A, T32, F10.3, A)') "Maximum height:",           H,            " m"
  WRITE(*, '(A, T32, F10.3, A)') "Flight time:",              T_fly,        " s"
  WRITE(*, '(A, T32, F10.3, A)') "Firing range:",             R,            " m"
  WRITE(*, '(A, T32, F10.3, A)') "Kinetic energy:",           Ek / 1000.0D0, " kJ"
  WRITE(*, '(A)')                 "================================================"

END PROGRAM ballistic_passport
