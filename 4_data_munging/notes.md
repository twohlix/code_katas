Data Munging notes
==================

December 11, 2013 230am
-----------------------
Gave up on '#!/usr/bin/env ruby' as it doesn't seem to be working. I'm fine with running ruby 'file.rb'.
Running into issues using string.unpack using a generated format. Spending a lot of time getting this plaintext table into a hash.
FUCK. I've been hung up on a whitespace error on one of the lines. I'll just make sure all lines are the same length, or pad with whitespace. That was it, pad function helped.