#Sents class
class Sents
  attr_accessor :sentiment

#loads AFINN term sentiments file to @sentiment hash
  def initialize
    @sentiment = Hash[File.read('lib/AFINN-111.txt').split(" ").each_slice(2).to_a]
  end
end
