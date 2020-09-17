module Types
  class MutationType < Types::BaseObject
    field :add_account, mutation: Mutations::AddAccountMutation
    field :update_account, mutation: Mutations::UpdateAccountMutation
    field :delete_account, mutation: Mutations::DeleteAccountMutation
    field :add_result_center, mutation: Mutations::AddResultCenterMutation
    field :update_result_center, mutation: Mutations::UpdateResultCenterMutation
    field :delete_result_center, mutation: Mutations::DeleteResultCenterMutation
    field :add_entry, mutation: Mutations::AddEntryMutation

  end
end
