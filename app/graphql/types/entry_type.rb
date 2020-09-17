module Types
  class EntryType < Types::BaseObject
    field :id, ID, null: false
    field :date, GraphQL::Types::ISO8601Date, null: false
    field :value, Float, null: false
    field :memo, String, null: true
    field :account, Types::AccountType, null: false
    field :result_center, Types::ResultCenterType, null: false
    field :clipped_memo, String, null: true

    def clipped_memo
      if object.memo != nil
        object.memo[0..2]
      else
        object.memo
      end
    end

  end
end
