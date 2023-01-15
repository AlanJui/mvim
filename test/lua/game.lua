-- create a game where a player can guess a number

-- create a variable to store the number of guesses
-- the player has made
-- (we'll use this later to limit the number of guesses)
--
local randomNumber = math.random(1, 10)
local numberOfGuesses = 3
local guessNumber

-- loop until the player has guessed the correct number
-- or has run out of guesses
repeat
	for i = 1, numberOfGuesses, 1 do
		-- 告知玩家目前為第幾回合
		print("\n")
		print("【第" .. i .. "回合】：")

		-- 提示玩家可以輸入猜想之數
		print("Guess a number between 1 and 10: ")
		guessNumber = io.read("n")

		-- 檢查玩家輸入之數，是否符合遊戲生成之數
		if guessNumber > randomNumber then
			print("The number is lower than " .. guessNumber .. ". Try again.")
		elseif guessNumber < randomNumber then
			print("The number is higher than " .. guessNumber .. ". Try again.")
		else
			print("You guessed the number!!")
			break
		end

		if i == numberOfGuesses then
			return
		end
	end
until guessNumber == randomNumber
