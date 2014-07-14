    !***************************************!
    !   the global library of precracks     !
    !   used in the analysis;               !
    !                                       !
    !   this module is generated by the     !
    !   preprocessing programme             !
    !***************************************!

include 'precrack_module.f90'

module lib_precrack_module
use parameter_module
use precrack_module

implicit none
save

    type(precrack2d),allocatable :: lib_precrack2d(:)
    ! and other types of precracks in the future...



contains




    subroutine initialize_precrack()

        integer                 :: nprc2d, i
        real(dp),allocatable    :: prc2dtip(:,:)
        integer, allocatable    :: prc2dtype(:)
        
        ! initialize local variable
        nprc2d=0; i=0
        
!-----------------------------------------------------------------------------------------------        
!       enter no. of precrack below 
!-----------------------------------------------------------------------------------------------
        nprc2d=1
        
        
        if (nprc2d.gt.0) then
    
            ! allocate space for precracks
            allocate(lib_precrack2d(nprc2d)) 
    
            ! initialize prctip
            allocate(prc2dtip(4,nprc2d))
            prc2dtip(:,:)=zero  

            ! initialize prctype 
            allocate(prc2dtype(nprc2d))
            prc2dtype(:)=0 

               
!-----------------------------------------------------------------------------------------------    
!           enter precrack tip coords below  
!           according to the no. of precracks
!           DONT forget the COMMA when adding new crack coords
!-----------------------------------------------------------------------------------------------
            prc2dtip &
     &      =reshape([ &
     &      0.7_dp, 0.8_dp,  1._dp, 1.1_dp  &           ! (x1,y1)-(x2,y2) of precrack 1
     !~&      ,0._dp, -1._dp,  1._dp, 0._dp   &           ! (x1,y1)-(x2,y2) of precrack 2
     !~&      ,0.125_dp, 0.125_dp,   0.05_dp, -0.05_dp  & ! (x1,y1)-(x2,y2) of precrack 3
     &      ],[4,nprc2d],order=[1,2])


                    
!-----------------------------------------------------------------------------------------------           
!           enter precrack types below 
!           according to the no. of precracks 
!           3: weak discon. 4: cohesive 5: strong discon. 
!-----------------------------------------------------------------------------------------------
            prc2dtype=[5] 
            




!-----------------------------------------------------------------------------------------------           
!           create the 2d precracks 
!-----------------------------------------------------------------------------------------------
            do i=1,nprc2d
                call create(lib_precrack(i),ctip=prc2dtip(:,i),ctype=prc2dtype(i))
            end do
            
           
            
        end if

    end subroutine initialize_precrack





end lib_precrack_module