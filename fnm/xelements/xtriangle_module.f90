    module xtriangle_module
      use parameter_module
      use subelement_module
      
      implicit none
      private

      integer,parameter :: nnode=3, nedge=3

      type, public :: triangle ! breakable triangle
        integer :: end_node(nnode)
      end type triangle
      

      type, public :: xtriangle ! breakable triangle
        integer :: end_node(nnode) ! cnc to glb node arrays for accessing glb real(vertex) node numbers
        integer :: edge(nedge) ! cnc to glb edge arrays for accessing status var. and glb flo node numbers
        integer,allocatable :: flo_node(:) ! assigned to this surface, in addition to the flo nodes on edge
        integer :: curr_status
        type(subelement),allocatable :: sub_elem(:) ! sub element connectivities
      end type xtriangle
      
      interface empty
        module procedure empty_xtriangle
      end interface
      
      interface update
        module procedure update_xtriangle
      end interface

      public :: empty,update


 
      contains




      ! empty a breakable triangle
      subroutine empty_xtriangle(this_xtriangle)
      
      	type(xtriangle),intent(inout) :: this_xtriangle
        
        integer :: istat
      	
        this_xtriangle%end_node(:)=0
        this_xtriangle%edge(:)=0
        this_xtriangle%curr_status=0

        if(allocated(this_xtriangle%flo_node)) then
        deallocate(this_xtriangle%flo_node,stat=istat)
            if(istat/=0) stop"**deallocation error in empty_xtriangle**"
        end if

      end subroutine empty_xtriangle
 


     
      ! update a breakable triangle
      subroutine update_xtriangle(this_xtriangle,curr_status,end_node,&
      & edge,flo_node)
      
      	type(xtriangle),intent(inout) :: this_xtriangle
        integer,optional,intent(in) :: curr_status
        integer,optional,intent(in) :: end_node(:),edge(:),flo_node(:)
        
        integer :: istat
      	
        if(present(curr_status)) this_xtriangle%curr_status=curr_status
        
        if(present(end_node)) then
            if(size(end_node)==size(this_xtriangle%end_node)) then
                this_xtriangle%end_node(:)=end_node(:)
            else
                stop"**wrong size for xtriangle end_node component**"
            end if
        end if
        
        if(present(edge)) then
            if(size(edge)==size(this_xtriangle%edge)) then
                this_xtriangle%edge(:)=edge(:)
            else
                stop"**wrong size for xtriangle edge component**"
            end if
        end if
        
        if(present(flo_node)) then
            if(allocated(this_xtriangle%flo_node)) then
                if(size(flo_node)==size(this_xtriangle%flo_node)) then
                    this_xtriangle%flo_node(:)=flo_node(:)
                else
                    deallocate(this_xtriangle%flo_node,stat=istat)
                    if(istat/=0) stop"**deallocation error in update_xtriangle**"
                    allocate(this_xtriangle%flo_node(size(flo_node)),stat=istat)
                    if(istat/=0) stop"**reallocation error in update_xtriangle**"
                    this_xtriangle%flo_node(:)=flo_node(:)
                end if         
            else
                allocate(this_xtriangle%flo_node(size(flo_node)),stat=istat)
                if(istat/=0) stop"**allocation error in update_xtriangle**"
                this_xtriangle%flo_node(:)=flo_node(:)            
            end if
        end if

      end subroutine update_xtriangle      
      
      
    end module xtriangle_module