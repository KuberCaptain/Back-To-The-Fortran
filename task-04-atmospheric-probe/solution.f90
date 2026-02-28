PROGRAM atmospheric_probe
  IMPLICIT NONE

  ! ISA physical constants
  REAL(8), PARAMETER :: P0      = 101325.0D0    ! Pa,      sea-level pressure
  REAL(8), PARAMETER :: T0_K    = 288.15D0      ! K,       sea-level temperature
  REAL(8), PARAMETER :: L_trop  = 0.0065D0      ! K/m,     troposphere lapse rate
  REAL(8), PARAMETER :: L_upper = 0.001D0       ! K/m,     upper stratosphere lapse rate
  REAL(8), PARAMETER :: g_acc   = 9.80665D0     ! m/s²,    gravitational acceleration
  REAL(8), PARAMETER :: M_air   = 0.0289644D0   ! kg/mol,  molar mass of dry air
  REAL(8), PARAMETER :: R_gas   = 8.31446D0     ! J/mol·K, universal gas constant
  REAL(8), PARAMETER :: T_strat = 216.65D0      ! K,       lower stratosphere temperature
  REAL(8), PARAMETER :: P_11    = 22632.1D0     ! Pa,      pressure at 11,000 m
  REAL(8), PARAMETER :: P_20    = 5474.9D0      ! Pa,      pressure at 20,000 m

  ! Precomputed pressure exponents
  REAL(8), PARAMETER :: EXP_T = g_acc * M_air / (R_gas * L_trop)   ! ≈  5.256
  REAL(8), PARAMETER :: EXP_U = g_acc * M_air / (R_gas * L_upper)  ! ≈ 34.163

  REAL(8)       :: h, T_c, T_k, P
  CHARACTER(25) :: layer_name
  CHARACTER(45) :: status_msg

  WRITE(*, '(A)') "Enter altitude (m):"
  READ(*, *) h

  IF (h < 0.0D0) THEN
    WRITE(*, '(A)') "ERROR: Altitude cannot be negative."
    STOP
  END IF

  ! --- Beyond model ---
  IF (h > 32000.0D0) THEN
    WRITE(*, '(A)')                "========== ATMOSPHERIC PASSPORT =========="
    WRITE(*, '(A, T22, F10.1, A)') "Altitude:",  h,  " m"
    WRITE(*, '(A, T22, A)')        "Layer:",      "Mesosphere"
    WRITE(*, '(A)')                "------------------------------------------"
    WRITE(*, '(A)')                "WARNING: Probe has left the reliable zone."
    WRITE(*, '(A)')                "ISA model is not valid above 32,000 m."
    WRITE(*, '(A)')                "=========================================="
    STOP
  END IF

  ! --- ISA layer selection ---
  IF (h <= 11000.0D0) THEN
    layer_name = "Troposphere"
    T_c = 15.0D0 - 0.0065D0 * h
    P   = P0 * (1.0D0 - L_trop * h / T0_K) ** EXP_T

  ELSE IF (h <= 20000.0D0) THEN
    layer_name = "Lower Stratosphere"
    T_c = -56.5D0
    P   = P_11 * EXP(-g_acc * M_air * (h - 11000.0D0) / (R_gas * T_strat))

  ELSE
    layer_name = "Upper Stratosphere"
    T_c = -56.5D0 + 0.001D0 * (h - 20000.0D0)
    P   = P_20 * (T_strat / (T_c + 273.15D0)) ** EXP_U

  END IF

  T_k = T_c + 273.15D0

  ! --- Status message ---
  IF (T_c < -50.0D0) THEN
    status_msg = "Extreme Cold: Lubricants may freeze!"
  ELSE IF (T_c >= 0.0D0) THEN
    status_msg = "Thaw: Potential sensor condensation."
  ELSE
    status_msg = "Normal Operating Conditions."
  END IF

  ! --- Atmospheric passport ---
  WRITE(*, '(A)')                "========== ATMOSPHERIC PASSPORT =========="
  WRITE(*, '(A, T22, F10.1, A)') "Altitude:",  h,   " m"
  WRITE(*, '(A, T22, A)')        "Layer:",      TRIM(layer_name)
  WRITE(*, '(A, T22, F10.2, A)') "Temp (C):",  T_c, " deg C"
  WRITE(*, '(A, T22, F10.2, A)') "Temp (K):",  T_k, " K"
  WRITE(*, '(A, T22, F10.2, A)') "Pressure:",  P,   " Pa"
  WRITE(*, '(A)')                "------------------------------------------"
  WRITE(*, '(A, 1X, A)')         "Status:", TRIM(status_msg)
  WRITE(*, '(A)')                "=========================================="

END PROGRAM atmospheric_probe
