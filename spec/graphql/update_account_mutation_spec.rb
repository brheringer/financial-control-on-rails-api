require "rails_helper"

RSpec.describe Types::MutationType do

  describe "update account" do
    let!(:account) { create(:account) } #let! não é lazy; let é lazy; usa factoy_bot

    let(:query) do
      %(mutation UpdateAccountMutation($id: ID!, $structure: String!, $name: String!) {
        updateAccount(id: $id, structure: $structure, name: $name) {
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
          variables: {id:account.id, structure:'1.1', name:'account name'})
          .as_json
    end

    it "updates the account" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['updateAccount']['account']['id']).to eq('1')
      expect(result['data']['updateAccount']['account']['structure']).to eq('1.1')
      expect(result['data']['updateAccount']['account']['name']).to eq('account name')
    end
  end

end
