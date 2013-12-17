Anagrams notes
==============

December 17, 2013 3am
---------------------
So I've added a dict to ubuntu (apt-get install wamerican) to solve my first hurdle. I plan on reading in the words list into an array for possible words. Then to just do an O(n) search for anagrams I'll create a hash of sorted letters of the word being the key and the values being the words. So as I search through the word list, I just sort the string in alphabetical order and then I should just have to try and add a word for each sorted 'hash'. 

What do you know. IT WORKED! Halved the memory usage by not even storing a words list to compare against. We can do it as we're reading it in. silly me.

I suppose I could eliminate the duplicates I'm getting. not sure why i'm getting dupes. The dupes are due to casing. 'La' is different than 'la'. I could not add the found anagram if its downcased version can be found in the array. This would go from O(n) to O(n+m) m being number of anagrams.

I can pull out the anagram word list and make it a class. Nice things would be, you just feed in words and then you can get the anagrams for any word you want. Lookup of anagrams should be O(1), which is neat. However memory is n+m. That was succesful.