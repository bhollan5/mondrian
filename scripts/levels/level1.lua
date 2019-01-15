level1 = {}

function level1:load()

    dialogue:insert('Hi!')
    dialogue:insert('Piet Mondrian made pictures out of colors, and then said they didn’t represent anything - they were meant to be purely abstract! ')
    dialogue:insert('What a wacky guy!!')
    dialogue:insert('Anyway, that lil black square there is you!! \n You can move around with the arrow keys, and jump with space!')
    gamestate = 'lvl1' 

    --the platforms below are ordered as follows: left to right, top to bottom
    --sticky:newBlock(0, 14, 8, 1)
    solid:newBlock(0, 20, 7, 1)
    solid:newBlock(0, 22, 7, 2)
    solid:newBlock(0, 25, 7, 11)
    
    bouncy:newBlock(10, 28, 8, 3)
    sticky:newBlock(10, 32, 8, 2)
    death:newBlock(10, 35, 8, 1)

    solid:newBlock(21, 20, 7, 1)
    solid:newBlock(21, 22, 7, 2)
    solid:newBlock(21, 25, 7, 11)

    --red square with solid square inside
    death:newBlock(34, 15, 8, 2)
    death:newBlock(42, 17, 2, 8)
    death:newBlock(36, 23, 8, 2)
    death:newBlock(34, 17, 2, 8)
    solid:newBlock(38, 19, 2, 2)

    --sticky angle platform
    sticky:newBlock(31, 28, 19, 3)
    sticky:newBlock(47, 15, 3, 16)

    -- lower solid decorative blocks
    solid:newBlock(31, 32, 8, 2)
    solid:newBlock(31, 35, 8, 1)

    solid:newBlock(51, 15, 1, 8)
    solid:newBlock(53, 15, 2, 8)

    solid:newBlock(51, 32, 4, 4)

    -- uppzer solid zig zag
    solid:newBlock(34, 10, 8, 2)
    solid:newBlock(34, 2, 2, 8)
end