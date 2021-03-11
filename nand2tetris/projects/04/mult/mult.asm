// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

// pseudo code
// R2 = 0 initialize result
// for (i=0; i<R1; i++) {  Add R0 to result R1 times
//    R2 = R2 + R0
//    i = i + 1
//  }
// end pseudo code

@R2
M=0  // set results register to 0
@i
M=0 // initialize i

(LOOP)
// if (i == R1) goto END
@i
D=M
@R1
D=D-M
@END
D; JEQ

// R2 = R2 + R0
@R0
D=M
@R2
M=D+M

// i++
@i
M=M+1

@LOOP
0; JMP

(END)
@END
0; JMP
