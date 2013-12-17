Anagrams notes
==============

December 17, 2013 3am
---------------------
So I've added a dict to ubuntu (apt-get install wamerican) to solve my first hurdle. I plan on reading in the words list into an array for possible words. Then to just do an O(n) search for anagrams I'll create a hash of sorted letters of the word being the key and the values being the words. So as I search through the word list, I just sort the string in alphabetical order and then I should just have to try and add a word for each sorted 'hash'. 

What do you know. IT WORKED!