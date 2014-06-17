       module modprecrack ! precrack info for all subroutines & all elements
        use modparam
        implicit none

        integer :: nprc
        integer, allocatable :: prctype(:)
        real(kind=dp), allocatable :: prctip(:,:) ! global dynamic array, status remains unless explicitly changed

        contains 

c        subroutine assignprc(nprc,prctype,prctip)
c
c        integer,intent(in) :: nprc
c        integer, allocatable, intent(inout) :: prctype(:)
c        real(kind=dp),allocatable,intent(inout) :: prctip(:,:)

        subroutine assignprc()

        nprc=0 ! initialize nprc
        
!-----------------------------------------------------------------------------------------------        
!---------- enter no. of precrack below --------------------------------------------------------
!-----------------------------------------------------------------------------------------------
        nprc=1
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------
        
        
        if (nprc.gt.0) then
            if(.not.allocated(prctip)) then
            allocate(prctip(4,nprc))
            prctip(:,:)=zero ! initialize prctip
            

            prctip
     &      =reshape((/
     
!-----------------------------------------------------------------------------------------------    
!---------- enter precrack tip coords below ---------------------------------------------------- 
!---------- according to the no. of precracks --------------------------------------------------
!---------- DONT forget the COMMA when adding new crack coords ---------------------------------
!-----------------------------------------------------------------------------------------------
     &      0.7_dp, 0.8_dp,  1._dp, 1.1_dp                  ! (x1,y1)-(x2,y2) of precrack 1 
c     &      ,0._dp, -1._dp,  1._dp, 0._dp                  ! (x1,y1)-(x2,y2) of precrack 2
c     &      ,0.125_dp, 0.125_dp,   0.05_dp, -0.05_dp       ! (x1,y1)-(x2,y2) of precrack 3
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------


     &      /),(/4,nprc/),order=(/1,2/))
            end if
            
            if(.not.allocated(prctype)) then
            allocate(prctype(nprc))
            prctype(:)=0 ! initialize prctype
            
            
!-----------------------------------------------------------------------------------------------           
!---------- enter precrack types below ---------------------------------------------------------
!---------- according to the no. of precracks --------------------------------------------------
!---------- 3: weak discon. 4: cohesive 5: strong discon. --------------------------------------
!-----------------------------------------------------------------------------------------------
            prctype=(/5/)
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------
!-----------------------------------------------------------------------------------------------


            end if
        end if
c
        end subroutine assignprc
c
c
       end module modprecrack