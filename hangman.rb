#require 'google-10000-english-no-swears.txt'
class GAME
    words = File.readlines('google-10000-english-no-swears.txt')
    goodWords = Array.new

    words.each do |word|
        if word.length > 5 && word.length < 12
            goodWords.push word
        end
    end

    secret = goodWords[rand(goodWords.length)]
    puts secret
    guesses = ""
    result = ""
    wrongletters = ""
    for i in 0..secret.length-1     #makes a string equal in length to secret
        result = result + "-"
    end

    while (secret != result)
        puts result
        puts "Wrong letters (up to 10): " + wrongletters
        puts "Guess a letter: "
        guesses = guesses + gets
        wrongletters = guesses
        puts

        # Compares each guess with each character in the secret word
        for i in 0..secret.length-1
            for j in 0..guesses.length-1
                if secret[i] == guesses[j]
                    result[i] = secret[i]
                    # Removes the correctguesses from the wrong ones.
                    for k in 0..wrongletters.length-1
                        if result[i] == wrongletters[k]
                            wrongletters[k] = ""
                            break
                        end
                    end
                    break
                end
            end
        end
    end

    puts result
    if result == secret
        puts "You win!"
    end
end

GAME.new