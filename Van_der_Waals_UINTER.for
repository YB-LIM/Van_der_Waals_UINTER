C*****************************************************************
C     UINTER subroutine example for Van der Waals interaction
C   
C     AUTHOR: Youngbin LIM
C     CONTACT: Youngbin.LIM@3ds.com
C
C*****************************************************************
C     PROPS(1)     : Van der Waals constants epsilon
C     PROPS(2)     : Van der Waals constants sigma
C     PROPS(3)     : Number of molecules per volume in domain 1
C     PROPS(4)     : Number of molecules per volume in domain 2
C
C*****************************************************************
      subroutine uinter(stress,ddsddr,amki,amski,flux,ddfddt,ddsddt,
     1     ddfddr,statev,sed,sfd,spd,svd,scd,pnewdt,rdisp,drdisp,
     2     temp,dtemp,predef,dpred,time,dtime,freqr,ciname,slname,
     3     msname,props,coords,aLocalDir,drot,area,chrLngth,node,ndir,
     4     nstatv,npred,nprops,mcrd,kstep,kinc,kit,linper,lOpenClose,
     5     lState,lSdi,lPrint)
C 
      include 'aba_param.inc'
C 
      dimension stress(ndir),ddsddr(ndir,ndir),flux(2),ddfddt(2,2),
     $     ddsddt(ndir,2),ddfddr(2,ndir),statev(nstatv),rdisp(ndir),
     $     drdisp(ndir),temp(2),dtemp(2),predef(2,npred),dpred(2,npred),
     $     time(2),props(nprops),coords(mcrd),aLocalDir(3,3),
     $     drot(2,2),amki(ndir,ndir),amski(ndir,ndir)
C 
      character*80 ciname,slname,msname
C  
      parameter(ZERO=0.D0, ONE=1.D0, THREE=3.D0, FIVE=5.D0, ENINE=9.D0,
     1          FTFIVE=45.D0, PI=3.1415926535D0, c=0.636D0)
C
C     Read interaction properies from input file
C
      EPS = PROPS(1)
      SIGMA = PROPS(2)
      beta1 = PROPS(3)
      beta2 = PROPS(4)
C     Parameter calculation
      Alpha = PI*beta1*beta2*EPS*(SIGMA**THREE)
      r0 = c*SIGMA
      TOL = r0/FIVE      
C     
C     Initialized stress & ddsddr
C 
      DO K1=1,ndir
        stress(K1)=ZERO
        DO K2=1,ndir
          ddsddr(K1,K2)=ZERO
        END DO
      END DO
C
      R = abs(rdisp(1))
C      
      IF (R .GE. TOL) THEN
        lOpenClose = 1
C
C     Van der waals force as surface pressure
C
        SoR = SIGMA/R
        stress(1) = Alpha*((ONE/FTFIVE)*(SoR**ENINE)
     1            -(ONE/THREE)*(SoR**THREE))
C
C     Calculate ddsddr, interface stiffness matrix
C
        ddsddr(1,1) = (Alpha/R)*((ONE/FIVE)*(SoR**ENINE)
     1                -(SoR**THREE))
C
C     Set the upper bound limit of Van der Waals repulsive force
C     to prevent division by zero
C
      ELSE IF (R .LT. TOL) THEN
        lOpenClose = 1
C
        SoT = SIGMA/TOL
        stress(1) = Alpha*((ONE/FTFIVE)*(SoT**ENINE)
     1            -(ONE/THREE)*(SoT**THREE))	 
C
        ddsddr(1,1) = ZERO
C
      END IF
C
      return
      end