Data Munging notes
==================

December 11, 2013 230am
-----------------------
Gave up on '#!/usr/bin/env ruby' as it doesn't seem to be working. I'm fine with running ruby 'file.rb'.
Running into issues using string.unpack using a generated format. Spending a lot of time getting this plaintext table into a hash.
FUCK. I've been hung up on a whitespace error on one of the lines. I'll just make sure all lines are the same length, or pad with whitespace. That was it, pad function helped. Pretty easy after that.

Going to clean it up a bit.

Football code was much faster to get up and running, presumably because of what I learned. Ran into an issue in removing characters before processing. Mainly the extra dashes.

Going to move onto part 3 and pull out shared functionality. DRY if you will. Used a callback methodology to keep the while loop contained as a shared functionality. If I were using classes I wouldn't have to use declared variables using @ everywhere. Simplifies the scripst a bunch. However I think this is a terrible design, but I'm too tired to fix it at the moment.