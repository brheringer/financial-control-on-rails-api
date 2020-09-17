module Mutations
    class AddAccountMutation < Mutations::BaseMutation
      argument :structure, String, required: true
      argument :name, String, required: true
  
      field :account, Types::AccountType, null: true
      field :errors, [String], null: false
  
      def resolve(structure:, name:)
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