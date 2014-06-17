       module modndelm
       use modparam
       implicit none
          integer::ndelm(12,9)
         contains
         subroutine initndelm()
          ndelm(:,:)=0
          ndelm(1,1)=1
          ndelm(2,1)=2
          ndelm(3,1)=6
          ndelm(4,1)=5
          ndelm(5,1)=17
          ndelm(6,1)=57
          ndelm(7,1)=18
          ndelm(8,1)=58
          ndelm(9,1)=19
          ndelm(10,1)=59
          ndelm(11,1)=20
          ndelm(12,1)=60
          ndelm(1,2)=2
          ndelm(2,2)=3
          ndelm(3,2)=7
          ndelm(4,2)=6
          ndelm(5,2)=21
          ndelm(6,2)=61
          ndelm(7,2)=22
          ndelm(8,2)=62
          ndelm(9,2)=23
          ndelm(10,2)=63
          ndelm(11,2)=58
          ndelm(12,2)=18
          ndelm(1,3)=3
          ndelm(2,3)=4
          ndelm(3,3)=8
          ndelm(4,3)=7
          ndelm(5,3)=24
          ndelm(6,3)=64
          ndelm(7,3)=25
          ndelm(8,3)=65
          ndelm(9,3)=26
          ndelm(10,3)=66
          ndelm(11,3)=62
          ndelm(12,3)=22
          ndelm(1,4)=5
          ndelm(2,4)=6
          ndelm(3,4)=10
          ndelm(4,4)=9
          ndelm(5,4)=59
          ndelm(6,4)=19
          ndelm(7,4)=27
          ndelm(8,4)=67
          ndelm(9,4)=28
          ndelm(10,4)=68
          ndelm(11,4)=29
          ndelm(12,4)=69
          ndelm(1,5)=6
          ndelm(2,5)=7
          ndelm(3,5)=11
          ndelm(4,5)=10
          ndelm(5,5)=63
          ndelm(6,5)=23
          ndelm(7,5)=30
          ndelm(8,5)=70
          ndelm(9,5)=31
          ndelm(10,5)=71
          ndelm(11,5)=67
          ndelm(12,5)=27
          ndelm(1,6)=7
          ndelm(2,6)=8
          ndelm(3,6)=12
          ndelm(4,6)=11
          ndelm(5,6)=66
          ndelm(6,6)=26
          ndelm(7,6)=32
          ndelm(8,6)=72
          ndelm(9,6)=33
          ndelm(10,6)=73
          ndelm(11,6)=70
          ndelm(12,6)=30
          ndelm(1,7)=9
          ndelm(2,7)=10
          ndelm(3,7)=14
          ndelm(4,7)=13
          ndelm(5,7)=68
          ndelm(6,7)=28
          ndelm(7,7)=34
          ndelm(8,7)=74
          ndelm(9,7)=35
          ndelm(10,7)=75
          ndelm(11,7)=36
          ndelm(12,7)=76
          ndelm(1,8)=10
          ndelm(2,8)=11
          ndelm(3,8)=15
          ndelm(4,8)=14
          ndelm(5,8)=71
          ndelm(6,8)=31
          ndelm(7,8)=37
          ndelm(8,8)=77
          ndelm(9,8)=38
          ndelm(10,8)=78
          ndelm(11,8)=74
          ndelm(12,8)=34
          ndelm(1,9)=11
          ndelm(2,9)=12
          ndelm(3,9)=16
          ndelm(4,9)=15
          ndelm(5,9)=73
          ndelm(6,9)=33
          ndelm(7,9)=39
          ndelm(8,9)=79
          ndelm(9,9)=40
          ndelm(10,9)=80
          ndelm(11,9)=77
          ndelm(12,9)=37
         end subroutine initndelm
       end module modndelm