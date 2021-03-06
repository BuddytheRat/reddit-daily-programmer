=begin
#####DESCRIPTION#####
A garland word[1] is one that starts and ends with the same N letters 
in the same order, for some N greater than 0, but less than the length 
of the word. I'll call the maximum N for which this works the garland 
word's degree. For instance, "onion" is a garland word of degree 2, 
because its first 2 letters "on" are the same as its last 2 letters. 
The name "garland word" comes from the fact that you can make chains 
of the word in this manner:
onionionionionionionionionionion...
Today's challenge is to write a function garland that, given a lowercase word, 
returns the degree of the word if it's a garland word, and 0 otherwise.
Examples

####EXAMPLES#####
garland("programmer") -> 0
garland("ceramic") -> 1
garland("onion") -> 2
garland("alfalfa") -> 4
Optional challenges

####OPTIONAL CHALLENGES#####
  1. Given a garland word, print out the chain using that word, as with 
{}"onion" above. You can make it as long or short as you like, even 
infinite.
  2. Find the largest degree of any garland word in the enable1 English 
word list[2] .
  3. Find a word list for some other language, and see if you can find a 
language with a garland word with a higher degree.
=end

def garland(word)
  (word.length-1).downto(0) { |i| return i if word[0..i-1] == word[-i..-1] }
end

tests = ['programmer', 'ceramic', 'onion', 'alfalfa']
tests.each do |test|
  puts "garland(#{test}): #{garland(test)}"
end


