module Mutations
  #class BaseMutation < GraphQL::Schema::RelayClassicMutation
  class BaseMutation < GraphQL::Schema::Mutation #- https://evilmartians.com/chronicles/graphql-on-rails-2-updating-the-data
    #argument_class Types::BaseArgument
    #field_class Types::BaseField
    #input_object_class Types::BaseInputObject
    #object_class Types::BaseObject
  end
end
