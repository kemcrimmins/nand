// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

// Pseudo code
// while True:
//  if KBD > 0:
//    paintScreen
//  else:
//    clearScreen

(LOOP)        // listen for keyboard input

  @KBD
  D=M           // check keyboard

  @CLEARSCREEN
  D; JEQ        // if no keypress, clear screen

  @PAINTSCREEN
  D; JGT        // if keypress, paint screen

  (CLEARSCREEN)
    @status
    M=0         // set screen status to 0

    @TOGGLESCREEN
    0;JMP

  (PAINTSCREEN)
    @status
    M=-1        // set screen status to -1 (1111111111111111)

    @TOGGLESCREEN
    0; JMP

  (TOGGLESCREEN)
    @SCREEN
    D=A
    @addr
    M=D         // addr = screen base address

    @KBD
    D=A
    @n
    M=D-1        // n = last address of screen memory map

    @i
    M=0       // initialize incrementer

    (SCREENLOOP)  // set all screen memory addresses to @status
      @addr
      D=M
      @n
      D=D-M
      @LOOP
      D; JEQ  // if at end of screen, listen keyboard input

      @status
      D=M
      @addr
      A=M
      M=D     // set RAM[addr] to @status

      @addr
      M=M+1   // addr++

      @SCREENLOOP
      0; JMP  // continue setting screen memory addresses

  @LOOP
  0; JMP
