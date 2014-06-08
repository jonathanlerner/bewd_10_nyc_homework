require 'rspec'
require 'mocha/api'
require_relative 'secret_number_game'

RSpec.configure do |config|
  config.mock_framework = :mocha
end

class SecretNumberGame
  attr_accessor :first_name, :last_name, :secret_number, :guesses
end

describe SecretNumberGame do
  before do
    @secret_number_game = SecretNumberGame.new
  end

  context "#created_by" do
    it "will give the game's creator" do
      @secret_number_game.first_name = "Joe"
      @secret_number_game.last_name = "Leo"

      @secret_number_game.created_by.should include("Joe")
      @secret_number_game.created_by.should include("Leo")
    end
  end

  context "#greeting" do
    it "will greet the player by name" do
      @secret_number_game.greet("Joe").should include("Joe")
    end

    it "will say how many guesses are left" do
      @secret_number_game.guesses = 4
      
      @secret_number_game.greet("Joe").should include("4")
    end
  end

  context "difficulty" do
    context "medium" do
      it "will set number of guesses" do
        @secret_number_game.set_difficulty "medium"

        @secret_number_game.guesses.should eq(3)
      end

      it "should behave the same for 2" do
        @secret_number_game.set_difficulty "2"

        @secret_number_game.guesses.should eq(3)
      end

      it "is case insensitive" do
        @secret_number_game.set_difficulty "MeDIum"

        @secret_number_game.guesses.should eq(3)
      end
    end

    context "hard" do
      it "will set number of guesses" do
        @secret_number_game.set_difficulty "hard"

        @secret_number_game.guesses.should eq(1)
      end

      it "should behave the same for 3" do
        @secret_number_game.set_difficulty "3"

        @secret_number_game.guesses.should eq(1)
      end

      it "is case-insensitive" do
        @secret_number_game.set_difficulty "HaRD"

        @secret_number_game.guesses.should eq(1)
      end
    end
    
    context "easy" do
      it "will set number of guesses for easy" do
        @secret_number_game.set_difficulty "Easy"

        @secret_number_game.guesses.should eq(5)
      end
      
      it "should behave the same for 1" do
        @secret_number_game.set_difficulty "1"

        @secret_number_game.guesses.should eq(5)
      end

      it "is case-insensitive" do
        @secret_number_game.set_difficulty "EasY"

        @secret_number_game.guesses.should eq(5)
      end
    end

    context "nonsense" do
      it "will ask again if no match" do
        @secret_number_game.expects(:ask_difficulty).once

        @secret_number_game.set_difficulty "foobar"
      end
    end
  end

  context "Guessing" do
    before do
      @secret_number_game = SecretNumberGame.new
      @secret_number_game.secret_number = 5
    end

    it "is correct if I guess correctly" do
      @secret_number_game.correct?(5).should be_true
    end

    it "is not correct if I guessed too high" do
      @secret_number_game.correct?(3).should be_false
    end

    it "is not correct if I guessed too low" do
      @secret_number_game.correct?(10).should be_false
    end
  end
end
