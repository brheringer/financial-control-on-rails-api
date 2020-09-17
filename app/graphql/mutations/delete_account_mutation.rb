module Mutations
    class DeleteAccountMutation < Mutations::BaseMutation
      argument :id, ID, required: true
  
      field :ok, Boolean, null: true
      field :errors, [String], null: false
  
      def resolve(id:)
        account = Account.find(id)
        if account.delete()
          { ok: true }
        else
          { errors: account.errors.full_messages }
        end
      end
      
    end
  end