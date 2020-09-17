module Mutations
    class DeleteResultCenterMutation < Mutations::BaseMutation
      argument :id, ID, required: true
  
      field :ok, Boolean, null: true
      field :errors, [String], null: false
  
      def resolve(id:)
        result_center = ResultCenter.find(id)
        if result_center.delete()
          { ok: true }
        else
          { errors: result_center.errors.full_messages }
        end
      end
      
    end
  end