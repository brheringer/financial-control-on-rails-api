module Mutations
    class UpdateAccountMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :structure, String, required: true
      argument :name, String, required: true
  
      field :account, Types::AccountType, null: true
      field :errors, [String], null: false
  
      def resolve(id:, structure:, name:)
        if id && id.to_i > 0
          result = update(id: id, structure: structure, name: name);
        else
          result = add(structure: structure, name: name);
        end
        result
      end

      def update(id:, structure:, name:)
        account = Account.find(id)
        if account.update(structure: structure, name: name)
          { account: account }
        else
          { errors: account.errors.full_messages }
        end
      end

      def add(structure:, name:)
        account = Account.new(
            structure: structure,
            name: name
        )
  
        if account.save
          { account: account }
        else
          { errors: account.errors.full_messages }
        end
      end
      
    end
end