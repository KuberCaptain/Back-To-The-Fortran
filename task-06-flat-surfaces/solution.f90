PROGRAM flat_surfaces
  IMPLICIT NONE

  INTEGER,  PARAMETER :: N       = 10
  REAL(8),  PARAMETER :: CENTER  = 5.5D0       ! grid centre (indices 1..10)
  REAL(8),  PARAMETER :: SCALE   = 4.5D0       ! half-width for normalisation
  REAL(8),  PARAMETER :: TILT    = 1.5D0       ! lean factor at edges

  ! Unit light vector: from upper-right  (1, 1, 1)/sqrt(3)
  REAL(8),  PARAMETER :: LX = 0.57735026919D0
  REAL(8),  PARAMETER :: LY = 0.57735026919D0
  REAL(8),  PARAMETER :: LZ = 0.57735026919D0

  REAL(8) :: normals(N, N, 3)     ! surface normal for each grid cell
  REAL(8) :: intensity(N, N)      ! Lambertian intensity  I = max(0, N·L)
  REAL(8) :: nx, ny, nz, len, dot
  REAL(8) :: dx, dy
  INTEGER :: i, j
  CHARACTER(1) :: ch

  ! --- Build hill normals ---
  ! Convention: nx > 0 tilts rightward; ny > 0 tilts toward screen-top (row 1).
  ! At the centre dx = dy = 0, so the normal is (0, 0, 1) — pointing straight up.
  DO i = 1, N
    DO j = 1, N
      dx =  (DBLE(j) - CENTER) / SCALE   ! ranges -1 .. +1  (left → right)
      dy = -(DBLE(i) - CENTER) / SCALE   ! ranges -1 .. +1  (bottom → top)
      nx = dx * TILT
      ny = dy * TILT
      nz = 1.0D0
      len = SQRT(nx*nx + ny*ny + nz*nz)
      normals(i, j, 1) = nx / len
      normals(i, j, 2) = ny / len
      normals(i, j, 3) = nz / len
    END DO
  END DO

  ! --- Lambertian intensity: I = max(0, N·L) ---
  DO i = 1, N
    DO j = 1, N
      dot = normals(i,j,1)*LX + normals(i,j,2)*LY + normals(i,j,3)*LZ
      intensity(i,j) = MAX(0.0D0, dot)
    END DO
  END DO

  ! --- ASCII render ---
  WRITE(*, '(A)') "======== THE SPLENDOR AND MISERY OF FLAT SURFACES ========"
  WRITE(*, '(A)') "  Lambertian shading  |  Light direction: upper-right (1,1,1)"
  WRITE(*, '(A)') "------------------------------------------------------------"

  DO i = 1, N
    DO j = 1, N
      ! Map 0.0 .. 1.0 to characters from dark to bright
      IF      (intensity(i,j) >= 0.80D0) THEN
        ch = '@'
      ELSE IF (intensity(i,j) >= 0.60D0) THEN
        ch = '#'
      ELSE IF (intensity(i,j) >= 0.40D0) THEN
        ch = '*'
      ELSE IF (intensity(i,j) >= 0.15D0) THEN
        ch = '.'
      ELSE
        ch = ' '
      END IF
      ! Print each char twice: terminals are taller than wide
      WRITE(*, '(2A1)', ADVANCE='NO') ch, ch
    END DO
    WRITE(*, *)
  END DO

  WRITE(*, '(A)') "------------------------------------------------------------"
  WRITE(*, '(A)') "  Legend:  ' ' < 0.15 < '.' < 0.40 < '*' < 0.60 < '#' < 0.80 < '@'"
  WRITE(*, '(A)') "============================================================"

END PROGRAM flat_surfaces
