#require 'google-10000-english-no-swears.txt'

words = File.readlines('google-10000-english-no-swears.txt')
#define blank array

def select_word(words)
    words.each do |word|
        if word.length > 5 && word.length < 12
            #array.add word
        end
    end
end