class Contact < ApplicationRecord
    include Sortable
    belongs_to :user
    validates :cpf, presence: true, uniqueness: { scope: :user_id, message: "deve ser único para cada usuário" }

    def self.sort_by
        %w[name]
    end

    private_class_method :sort_by
  end
