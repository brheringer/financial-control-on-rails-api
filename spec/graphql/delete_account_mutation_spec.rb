require "rails_helper"

RSpec.describe Types::MutationType do

  describe "delete account" do
    let!(:account) { create(:account) } #let! não é lazy; let é lazy; usa factoy_bot

    let(:query) do
      %(mutation DeleteAccountMutation($id: ID!) {
        deleteAccount(id: $id) {
          ok
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {id:account.id})
          .as_json
    end

    it "deletes the account" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['deleteAccount']['ok']).to be true
      #TODO consultar e garantir que nao existe mais?
    end
  end

end
