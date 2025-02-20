(INIT)
    // Init plot position
    A = 0
    D = A
    @POSITION_X
    M = D
    A = 64
    D = A
    @POSITION_Y
    M = D

    A = 256
    D = A
    @DOT_COUNT
    M = D

    // Setup color
    A = 255
    D = A
    @RED
    M = D
    A = 255
    D = A
    @GREEN
    M = D
    A = 255
    D = A
    @BLUE
    M = D

(RESET)
    @16384
    M = 1
    M = 0
    // Disable screen write
    @16390
    M = 0

(DRAW_DOT)
    // Setup coordinate for drawing
    @POSITION_X
    D = M
    @16385
    M = D
    @POSITION_Y
    D = M
    @16386
    M = D

    // Setup color
    @RED
    D = M
    @16387
    M = D
    @GREEN
    D = M
    @16388
    M = D
    @BLUE
    D = M
    @16389
    M = D

    // Enable write to screen
    @16390
    M = 1
    M = 0

    @POSITION_X
    M = M + 1
    @DOT_COUNT
    M = M - 1
    D = M
    @DRAW_DOT
    D ; JGT

(END)
    @END
    0 ; JMP