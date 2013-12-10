How Big, How Fast? notes
========================

December 10, 2013 4am
---------------------
First part of how many bits would it take to store an unsigned representation of a number was easy. I guess ComputerEngineering degree pays off big here. 10bits = 1000x, so 10, 20, 30, 40, and then 43 since 3 bits = 8x. 

20k residences. Each has a name, address and phone number stored as characters. Lets say 128chars for name, 256chars for address and 10chars (if we're efficient-ish) for phone numbers or 13 if we store the parentheses and dash. Worst case is (128+256+13)*20,000. Equals 397*20,000, lets just say 400 for math. 8,000,000chars (aka bytes if they're not unicode). Thats more realistic as the 13 characters is probably easier stored as 16 anyway.

1 million integers in a binary tree. Nodes and level estimate. 1 I'm confused if the integer counts as a node as well. I'll assume it does! If they dont just subtract 1 million from my answer. Well, 2 integers would be 3 nodes and 1 levels (i dont count leafs as a level?). 3 integers would be 5 nodes and 2 levels. 8 integers would be 15 nodes and 3 levels. 1 million integers would have 20 levels and 1 million + 500k + 250k + 125k + 67k + 33k + 16k + 8k + 4k + 2k + 1k + 500 + 250 + 125 + 67 + 33 + 16 + 8 + 4 +2 + 1, so ~2 million nodes. In a 32 bit architecture, the 1 million branch nodes would be 64 bits and each integer would be 32 bits so 64,000,000 bits + 32,000,000 bits if stored efficiently or 96,000,000 bits.

1200 body pages. How many words per page? 250? so 1200*250 words = 300,000 words. Lets say they're 8 characters on average including whitespace. so 2.4million chars or 19.2 million bits. 19,200,000 bits / 56,000 bits per second ~= 4000 seconds. ~1.25 hours to send that book over 56kbps.

10k binary search = 4.5ms. 100k binary search = 6ms. 10million elements? 10x increase = 1.5ms so 100x increase = 3ms+ so 9ms. I think this cause its a binary search and its linear increase in search for multiplied n increase. Although, what happens if you have to page thrash? heh, lots more time.

Making a rainbow table: 0-16 character passwords of 96 possible characters at each position. So password complexity is 16^96 or is it 96^16. Lesser value is 5.2e31, so if it were in seconds for brute force it would be 5.2e28. Nope, not viable to try at 1ms per attempt. Would need to be 1e-25 seconds per attempt to be reasonable. That is impossibly fast.