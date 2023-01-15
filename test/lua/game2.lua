-- 猜數值遊戲
local randomNumber = math.random(1, 10)

repeat
    io.write("Guess a number between 1 and 10: ")
    local guessNumber = io.read("n")

    if guessNumber > randomNumber then
        print("The number is lower than " .. guessNumber .. ". Try again.")
    elseif guessNumber < randomNumber then
        print("The number is higher than " .. guessNumber .. ". Try again.")
    else
        print("You guessed the number!!")
    end
until guessNumber == randomNumber
