Bloom Filters notes
===================

December 11, 2013 8pm
---------------------
The concept of the Bloom Filter is the easy part. Coming up with k hashes to use is the hard part. Seriously, the hashes are the hardest part. Math is hard compared to the other bits.
Made some hashes based off of MD5. Since you dont need the full md5 hash to fill up an array of size m (unless its ENORMOUS). This is also good for bushiness of the hashes. I think I'll implement one more that gives you as many hash results as it can given a particular m size.
Not sure if I actually need to store the object in the filter. I  guess if we're just excluding things it doesnt matter.

I'm getting too many successes. its like everything is succesful. I should print out the bitarray.