module Mutations
    class UpdateAccountMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :structure, String, required: true
      argument :name, String, required: true
  
      field :account, Types::AccountType, null: true
      field :errors, [String], null: false
  
      def resolve(id:, structure:, name:)
        account = Account.find(id)
        if account.update(structure: structure, name: name)
          { account: account }
        else
          { errors: account.errors.full_messages }
        end
      end
      
    end
  end