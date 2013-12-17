A Diversion notes
=================

December 17, 2013 4pm
---------------------
How many n-digit binary numbers are there that don't have two adjacent 1 bits?

Let's see if theres a pattern. I did this on paper
n: work
1: 0 1                                    2
2: 00 01 10 ~11~                          3
3: 000 001 010 ~011~ 100 101 ~110~ ~111~  5

I'm betting its a fibonnaci like pattern: f(n) = f(n-1) + f(n-2), when f(1) = 2 and f(2) = 3.
so for f(3) = 3 + 2 = 5
Let's test my assumption with f(4) = f(3) + f(2). So f(4) = 5 + 3 = 8. Let's test:

4: 0000 0001 0010 ~0011~ 0100 0101 ~0110~ ~0111~ 1000 1001 1010 ~1011~ ~1100~ ~1101~ ~1110~ ~1111~ 
that is 8 good answers. Looks like our function has worked for this. I suppose I just proved this via induction, right? I'll test one more case.

so f(5) = f(4) + f(3) = 8 + 5 = 13
5: 00000 00001 00010 ~00011~ 00100 00101 ~00110~ ~00111~ 01000 01001 01010 ~01011~ ~01100~ ~01101~ ~01110~ ~01111~
   10000 10001 10010 ~10011~ 10100 10101 ~10110~ ~10111~ ~11000~ ~11001~ ~11010~ ~11011~ ~11100~ ~11101~ ~11110~ ~11111~
That's 13. I think I've proven via induction but not properly. I've just brute forced and shown the pattern has worked out. Also the function is simple, so I'm betting its right (occam's razor or whatever). I need to learn more how to prove things mathmatically.

** f(n) = f(n-1) + f(n-2), when f(1) = 2 and f(2) = 3 **