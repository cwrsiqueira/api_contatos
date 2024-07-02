class ContactSerializer < ActiveModel::Serializer
  attributes :name, :cpf, :telephone, :address, :cep, :pos, :created_at, :updated_at

  belongs_to :user
end
