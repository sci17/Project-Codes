import pytest 
from guess_game import GuessingGame
from unittest.mock import patch

def test_guess_within_valid_range():
    with patch('random.randint', return_value=5):
        game = GuessingGame(min_value=1, max_value=10)
        
        # Valid guess should be correct
        valid_result = game.guess(5)
        assert valid_result == "Congratulations!!"
        
        # Once the game is over, any further guesses should return "Game is over"
        invalid_result = game.guess(15)  # Out of bounds, but game is over
        assert invalid_result == "Game is over"
        
        # Test that the game is indeed over
        assert game.game_over is True
