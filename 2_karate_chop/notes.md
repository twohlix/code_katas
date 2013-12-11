Karate Chop Test Notes
======================

December 10, 2013 3am
---------------------
First problem was getting Test::Unit to run, but google helped there. Never have run it independent of rails.
Second proble was getting my syntax for ruby right. I'm bad at ruby I'm finding. It's not natural yet.
Third problem was my initial sillyness made me think indices would somehow be preserved after a slice! Silly me.
Third problem was the major problem. I should slow down and think about the algo more before diving in. I think it works.

I'm going to add timing to this.
Benchmark's output is ugly, but fairly easy to use.

December 11, 2013 2am
---------------------
Making a recursive version of binary chop. Having a problem keeping the offset value right. Offset calculation was actually correct. I just had an off by one error on the length calculation for haystack.slice().

This method required an extra argument to pass the index_offset around. Luckily ruby has default_values in the argument string. cleans it up  nicely. Also did not have to do inplace slice!. Although that might save memory usage. I would have to measure that though. That is outside this kata.