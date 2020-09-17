module Mutations
    class AddEntryMutation < Mutations::BaseMutation
      argument :date, GraphQL::Types::ISO8601Date, required: true
      argument :value, Float, required: true
      argument :memo, String, required: false
      argument :account_id, ID, required: true
      argument :result_center_id, ID, required: true
  
      field :entry, Types::EntryType, null: true
      field :errors, [String], null: false
  
      def resolve(date:, value:, memo:, account_id:, result_center_id:)
        entry = Entry.new(
            date: date,
            value: value,
            memo: memo,
            account: Account.find(account_id),
            result_center: ResultCenter.find(result_center_id)
        )
  
        if entry.save
          { entry: entry }
        else
          { errors: entry.errors.full_messages }
        end
      end

    end
  end