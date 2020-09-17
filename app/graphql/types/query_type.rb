module Types
  class QueryType < Types::BaseObject

    field :accounts, [Types::AccountType], null: false, description: "Returns a list of accounts"
    def accounts
      Account.all
    end

    field :result_centers, [Types::ResultCenterType], null: false, description: "Returns a list of result centers"
    def result_centers
      ResultCenter.all
    end

    field :entries, [Types::EntryType], null: false, description: "Returns a list of entries"
    def entries
      #Entry.preload(:account)
      #Entry.preload(:result_center)
      Entry.all
    end

    #field :me, Types::UserType, null: true
    #def me
    #  context[:current_user] #parece que context eh um parametro da query do lado cliente
    #end
  end
end
