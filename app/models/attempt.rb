class Attempt
  include Mongoid::Document

  field :count, type: Integer, default: 1
  field :solved, type: Boolean, default: false
  field :points, type: Integer, default: 0

  belongs_to :profile
  belongs_to :question

  validates :count, numericality: { only_integer: true }

  scope :solved, where(solved: true)
  scope :unsolved, where(solved: false)

  def create_attempt(option_id, question_id, user_id)
    user = User.find(user_id)
    question = Question.find(attempt.question_id)
    attempts = user.profile.attempts

    attempts.each do |attempt|
      if attempt.question_id == question_id
        attempt.count++
        if question.answer(option_id)
          attempt.solved = true
          attempt.points = question.difficulty / attempt.count
          user.profile.points += attempt.points
        end
        attempt.save
        return true     
      end
    end
    new_attempt = Attempt.new(solved: false, question_id: question_id)
    user.profile.attempts << new_attempt
    return true
  end

    # verificar se jah existe um attempt pra questao com o usuario
    # se existir:
    #  incrementa o campo count em 1
    #  se a resposta for correta: 
    #     marca o campo solved como true
    #     coloca em points o valor da questao dividido pelo numero de counts
    #  se a resposta for incorreta:
    #     nao faz nada
    # 
    # se tiver completado o topico
    # cria um achievement pro usuario com o topico
end