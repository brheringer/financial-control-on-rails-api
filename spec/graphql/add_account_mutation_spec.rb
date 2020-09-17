require "rails_helper"

RSpec.describe Types::MutationType do

  describe "add account" do

    let(:query) do
      %(mutation AddAccountMutation($structure: String!, $name: String!) {
        addAccount(structure: $structure, name: $name) {
          account {
            id
            structure
            name
          }
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {structure:'1.1', name:'account name'})
          .as_json
    end

    it "creates an account" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['addAccount']['account']['structure']).to eq('1.1')
      expect(result['data']['addAccount']['account']['name']).to eq('account name')
    end
  end

end
