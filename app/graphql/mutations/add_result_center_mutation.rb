module Mutations
    class AddResultCenterMutation < Mutations::BaseMutation
      argument :name, String, required: true
  
      field :result_center, Types::ResultCenterType, null: true
      field :errors, [String], null: false
  
      def resolve(name:)
        result_center = ResultCenter.new(
            name: name
        )
  
        if result_center.save
          { result_center: result_center }
        else
          { errors: result_center.errors.full_messages }
        end
      end

    end
  end