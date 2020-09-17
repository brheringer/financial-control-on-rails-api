require "rails_helper"

RSpec.describe Types::MutationType do

  describe "add result center" do

    let(:query) do
      %(mutation AddResultCenterMutation($name: String!) {
        addResultCenter(name: $name) {
          resultCenter {
            id
            name
          }
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {name:'a center'})
          .as_json
    end

    it "creates a result center" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['addResultCenter']['resultCenter']['id']).to eq('1')
      expect(result['data']['addResultCenter']['resultCenter']['name']).to eq('a center')
    end
  end

end
