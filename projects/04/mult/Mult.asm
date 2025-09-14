// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// while(multiplier > 0) {
//   product += multiplicand;
//   multiplier--;
// }

@R0 // 데이터 메모리 주소0번의 값을 A레지스터에 넣는다.
D=M // D레지스터에 A레지스터에 있는 값을 데이터 메모리의 주소로 하는 값을 가져온다. 즉, M[R0]를 가져온다.
@multiplier // A레지스터 임의의 주소 multiplier를 넣는다.
M=D // D레지스터에 있는 값을 A레지스터에 있는 값으로 하는 데이터 메모리의 주소에 넣는다. 즉, M[multiplier]에 D레지스터의 값 저장한다.

// 여기까지의 정리는 R0에 있는 값을 변수 multiplier에 저장하는 것


@R1 // 데이터 메모리 주소1번의 값을 A레지스터에 넣는다.
D=M // D레지스터에 A레지스터에 있는 값을 데이터 메모리의 주소로 하는 값을 가져온다. 즉, M[R1]을 가져온다.
@multiplicand // A레지스터 임의의 주소 multiplicand를 넣는다.
M=D // D레지스터에 있는 값을 A레지스터에 있는 값으로 하는 데이터 메모리의 주소에 넣는다. 즉, M[multiplicand]에 D레지스터의 값 저장한다.

// 여기까지의 정리는 R1에 있는 값을 변수 multiplicand에 저장하는 것


@0 // A레지스터에 0을 넣는다.
D=A // D레지스터에 A레지스터의 값을 직접 넣는다.
@R2 // 데이터 메모리 주소2번의 값을 A레지스터에 넣는다.
M=D // D레지스터에 있는 값을 A레지스터에 있는 값으로 하는 데이터 메모리의 주소에 넣는다. 즉, M[R2]에 D레지스터의 값을 저장한다.

// 여기까지의 정리는 R2에 있는 값을 초기화 시키는 것

// 아래의 로직은 while(multiplier > 0) { R2 += multiplicand; multiplier--; }를 구현한 것이다.
// 이렇게 구현하는 이유는 CPU 수준에서 곱셈을 직접 지원하지 않기 때문에 반복적인 덧셈을 이용해서 구현해야 한다.

(LOOP) // LOOP 레이블 다음 실행할 명령을 담고 있는 명령어 메모리 주소를 기호 LOOP로 선언한다. 즉 `@multiplier`가 실행될 명령어 메모리 주소를 LOOP로 선언한다.


	@multiplier // A레지스터에 변수 multiplier의 주소값을 넣는다.
	D=M // A레지스터에 있는 값을 데이터 메모리의 주소로 하여 D레지스터에 넣는다. 즉, M[multiplier]의 값을 D레지스터에 저장한다.
	@END // A레지스터에 END 레이블 다음 실행할 명령을 담고 있는 명령어의 주소를 넣는다.
	D;JLE // 연산 결과(D레지스터의 값)가 0보다 작으면 A레지스터에 있는 값을 다음 명령어 메모리 주소로 설정한다.
	// 위 로직은 while(multiplier > 0)를 구현한 것이다.

	@multiplicand // A레지스터에 변수 multiplicand의 주소값을 넣는다.
	D=M // A레지스터에 있는 값을 데이터 메모리의 주소로 하여 D레지스터에 넣는다. 즉, M[multiplicand]를 D에 저장한다.
	@R2 // 데이터 메모리 주소2번의 값을 A레지스터에 넣는다.
	M=D+M // D레지스터 값과 M[product]의 값을 더해 M[R2]에 저장한다.
	@1 // A레지스터에 1을 넣는다.
	D=A // D레지스터에 A레지스터의 값을 직접 넣는다.
	@multiplier // A레지스터에 변수 multiplier의 주소값을 넣는다.
	M=M-D // // A레지스터에 있는 값을 데이터 메모리의 주소로 하는 값에 D레지스터의 값을 빼어 저장한다. 즉 M[multiplier] = M[multiplier] - 1을 수행한다.
	@LOOP // A레지스터에 LOOP 레이블 다음 실행할 명령을 담고 있는 명령어의 주소를 넣는다.
	0;JMP // 아무런 연산을 하지 않고 A레지스터에 있는 값을 다음 명령어 메모리 주소로 설정한다.
	// 위 로직은 R2 += multiplicand; multiplier--;를 구현한 것이다.


(END) // END 레이블 다음 실행할 명령을 담고 있는 명령어 메모리 주소를 기호 END로 선언한다. 즉 `@i`가 실행될 명령어 메모리 주소를 END로 선언한다.

// 여기까지의 정리는 변수 multiplier를 -1을 해가며 변수 R2에 변수 multiplicand를 더한다.

@END
0;JMP