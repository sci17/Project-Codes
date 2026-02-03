import random

class GuessingGame:
    def __init__(self, guess_num=random.randint, max_attempt=3, min_value=1, max_value=10):
        self.min_value = min_value
        self.max_value = max_value
        self.max_attempt = max_attempt
        self.attempt = 0
        self.guess_num = random.randint(min_value,max_value) 
        self.game_over = False
        self.won = False

    def guess(self, user):
        if self.game_over:
            return f"Game is over"
        
        if not self.invalid_guess(user):
            return f"Invalid input."
        
        self.attempt +=1

        if user == self.guess_num:
            self.game_over = True
            self.won = True
            return f"Congratulations!!"
        
        if self.attempt >= self.max_attempt:
            self.game_over = True
            return f"Game over! The number is {self.guess_num}"
        
        hint = "too high" if user > self.guess_num else "too low"
        return f"Wrong guess! Your guess is {hint}. Attempt left: {self.max_attempt - self.attempt}"
            
    def invalid_guess(self, user):
        return isinstance(user, int) and self.min_value <= user <= self.max_value
    
def play_game():
        game = GuessingGame()
        print("Welcome!")

        while not game.game_over:
            try:
                input_guess = int(input("Enter your guess:"))
                print(game.guess(input_guess))
            except ValueError:
                print("Invalid input!")

        if game.won:
            print("You won the game!")
        
        else:
            print("Better luck next time!")
if __name__ == "__main__":
        play_game()