module Mutations
    class UpdateResultCenterMutation < Mutations::BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
  
      field :result_center, Types::ResultCenterType, null: true
      field :errors, [String], null: false
  
      def resolve(id:, name:)
        result_center = ResultCenter.find(id)
        if result_center.update(name: name)
          { result_center: result_center }
        else
          { errors: result_center.errors.full_messages }
        end
      end
      
    end
  end