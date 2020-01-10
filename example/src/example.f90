module point_module

  type point
    real :: x
    real :: y
  end type

  interface operator (+)
    module procedure point_add
  end interface

contains

  function point_add(p1, p2) result(p3)
    type(point), intent(in) :: p1, p2
    type(point) :: p3
    p3%x = p1%x + p2%x
    p3%y = p1%y + p2%y
  end function

end module

program example
  use, intrinsic :: iso_fortran_env, only: ou=>output_unit
  use point_module

  type(point) :: a = point(1,2)
  type(point) :: b = point(2,4)
  type(point) :: c

  c = a + b
  write(ou,'(g0)') c%x, c%y
end program
