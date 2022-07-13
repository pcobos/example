class SlotMachine
  # We use an array to represent our list of items
  ITEMS = %w[cherry seven bell star joker]

  def initialize(reel = [])
    @reel = reel
  end

  def play
    # reassign the value of the @reel instance variable every time we play
    @reel = []
    # grab an item from the ITEMS array 3 times and push it to the @reel array
    3.times do
      @reel << ITEMS.sample
    end
    # Return the @reel array with three random items inside =['cherry', 'cherry', 'cherry']
    @reel
  end

  def score
    # Call our three identical items method on the condition
    if three_identical_items?
      # if it is true, return the base score (item index plus one) times ten
      base_score(@reel[0]) * 10
      # Call our two identical items and a joke method on the condition
    elsif two_identical_and_joker?
      # if it is true, return the base score (item index plus one) times 5
      base_score(@reel.sort[1]) * 5
    else
      # if none are the same, return zero
      0
    end
  end

  def three_identical_items?
    # check if the items inside the reels array are the same
    # uniq method eliminates duplicates, then we check the size of the array
    @reel.uniq.size == 1
  end

  def two_identical_and_joker?
    # check if the two of the items inside the reels array are the same and if there is a joker as well
    # uniq method eliminates duplicates, then we check the size of the array and verify if it includes a 'joker'
    @reel.uniq.size == 2 && @reel.include?('joker')
  end

  def base_score(item)
    #Grab the item's index and add one to get the base score
    ITEMS.index(item) + 1
  end
end
