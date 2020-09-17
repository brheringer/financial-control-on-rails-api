require "rails_helper"

RSpec.describe Types::MutationType do

  describe "update result center" do
    let!(:result_center) { create(:result_center) } #let! não é lazy; let é lazy; usa factoy_bot

    let(:query) do
      %(mutation UpdateResultCenterMutation($id: ID!, $name: String!) {
        updateResultCenter(id: $id, name: $name) {
          resultCenter {
            id
            name
          }
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {id:result_center.id, name:'updated name'})
          .as_json
    end

    it "updates the account" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['updateResultCenter']['resultCenter']['id']).to eq('1')
      expect(result['data']['updateResultCenter']['resultCenter']['name']).to eq('updated name')
    end
  end

end
