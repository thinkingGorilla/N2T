어셈블리 명령은 상수나 기호를 이용해서 메모리 위치(주소)를 참조할 수 있다.

## 미리 정의된 기호(predefined symbol)

- 가상 레지스터(virtual register)
  - R0~R15
  - RAM 주소 0~15를 참조
- 미리 정의된 포인터(predefined pointer)
  - SP, LCL, ARG, THIS, THAT
  - RAM 주소 0~4를 참조
  - SP=R0=0, LCL=R1=1, ARG=R2=2, THIS=R3=3, THAT=R4=4 
- I/O 포인터
  - SCREEN(= 16384₁₀(0x4000)), KBD(= 24576₁₀(0x6000)) 

## 레이블 기호(label symbol)

- goto 명령어의 목적지를 나타내는 레이블 기호
- 사용자가 (XXX)라는 시퀀스(pseudo-command)로 직접 선언

## 변수 기호(variable symbol)

- 미리 정의된 기호, 레이블 기호로 정의되지 않은 기호
- RAM 주소 16(0x0010)에서부터 차례대로 변수마다 유일한 메모리 주소를 할당