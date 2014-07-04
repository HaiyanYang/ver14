    !***************************************!
    !   the global library of elements      !
    !   used in the analysis;               !
    !                                       !
    !   this module is generated by the     !
    !   preprocessing programme             !
    !***************************************!
 

    include 'integration_point_module.f90'
    include 'toolkit_module.f90'
    include 'tri_element_module.f90'
    include 'quad_element_module.f90'
    include 'wedge_element_module.f90'
    !include 'brick_element_module.f90'
    ! ... and other future element modules ...
   
    module lib_elem_module
    use parameter_module
    use tri_element_module
    use quad_element_module
    use wedge_element_module
    ! ... and other future element modules ...
    
    implicit none
    save
    
    type(tri_element),allocatable   :: lib_tri(:)
    type(quad_element),allocatable  :: lib_quad(:)
    type(wedge_element),allocatable :: lib_wedge(:)
    
    contains
    
    subroutine initialize_lib_elem
    
        integer :: i=0, ntri=0, nquad=0, nwedge=0
        
        !~ntri=2
        !~nquad=1
        nwedge=2
    
        !~allocate(lib_tri(ntri))
        !~allocate(lib_quad(nquad))
        allocate(lib_wedge(nwedge))
        
    !~
    !~    do i=1, ntri
    !~        call empty(lib_tri(i))
    !~    end do
    !~    
    !~    do i=1, nquad
    !~        call empty(lib_quad(i))
    !~    end do
          do i=1, nwedge
            call empty(lib_wedge(i))
          end do
    
    !~    
    !~    call prepare(lib_tri(1),key=1,connec=[1,2,3],matkey=1)
    !~    call prepare(lib_tri(2),key=2,connec=[2,4,3],matkey=1)
    !~    call prepare(lib_quad(1),key=3,connec=[3,4,6,5],matkey=1)
    
        call prepare(lib_wedge(1),key=1,connec=[1,2,3,7,8,9],matkey=1)
        call prepare(lib_wedge(2),key=2,connec=[2,4,3,8,10,9],matkey=1)
    
    end subroutine initialize_lib_elem
      
    
    end module lib_elem_module