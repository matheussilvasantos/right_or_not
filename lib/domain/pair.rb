class Pair
  attr_reader :question, :answer

  def initialize(question:, answer:)
    @question = question
    @answer = answer
  end

  def to_h
    {
      question: question,
      answer: answer
    }
  end
end
