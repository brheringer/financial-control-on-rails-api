require "rails_helper"

RSpec.describe Types::MutationType do

  describe "delete result center" do
    let!(:result_center) { create(:result_center) } #let! não é lazy; let é lazy; usa factoy_bot

    let(:query) do
      %(mutation DeleteResultCenterMutation($id: ID!) {
        deleteResultCenter(id: $id) {
          ok
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {id:result_center.id})
          .as_json
    end

    it "deletes the result center" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['deleteResultCenter']['ok']).to be true
      #TODO consultar e garantir que nao existe mais?
    end
  end

end
