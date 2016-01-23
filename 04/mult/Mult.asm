// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Using additional variables in this file because I assume we shouldn't change RAM[0] and RAM[1]

// Set M[R2] = 0
@R2
M = 0

// Load the value of R0 into the "step" variable
@R0
D = M
@step
M = D

// Setup "i" for the loop
@R1
D = M
@i
M = D

// R2 = 0
@0
D = A
@R2
M = D

(loop)
    // Decrement counter
    @i
    M = M - 1
    D = M

    // If counter >= 0, jump to end
    @end
    D;JLT

    // Load step into D
    @step
    D = M

    // R2 += D
    @R2
    M = M + D

    // Jump back to loop
    @loop
    0;JMP


(end)
    @end
    0;JMP
