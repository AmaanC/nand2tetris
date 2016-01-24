// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Set R0 = 0
@0
D = A
@R0
M = D

(CHANGE_SCREEN)
    // Load R0 into D, and assign it to M[COUNT]
    // R0 is the parameter, -1 for black, 0 for white.
    // COUNT is the "word" of the screen memory page to write to

    @24575
    D = A
    @COUNT
    M = D

    (LOOP)
        // D = R0 (argument)
        @R0
        D = M

        // Use count as a pointer
        // A = &count
        // A = *A
        @COUNT
        A = M

        // M[A] = D
        // Screen word at counter pos = R0
        M = D

        // D = count - 1
        D = A - 1
        @COUNT
        M = D
        // D = D - screen
        @SCREEN
        D = D - A
        // Jump to loop if D >= 0
        @LOOP
        D; JGE


    @CHECK
    0;JMP

(CHECK)
    // Load keyboard input into D
    @KBD
    D = M

    // Jump to white if kbd == 0
    @WHITE
    D;JEQ

    // In both...functions(?) below, R0 is used as an argument passed to change_screen
    (BLACK)
        @R0
        M = -1
        @CHANGE_SCREEN
        0;JMP
    (WHITE)
        @R0
        M = 0
        @CHANGE_SCREEN
        0;JMP

    @CHECK
    0;JMP