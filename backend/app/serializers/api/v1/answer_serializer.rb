class Api::V1::AnswerSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :question
end
