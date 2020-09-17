require "rails_helper"

RSpec.describe Types::MutationType do
  let!(:account) { create(:account) }
  let!(:result_center) { create(:result_center) }

  describe "add entry" do

    let(:query) do
      %(mutation AddEntryMutation(
        $date: ISO8601Date!, 
        $value: Float!, 
        $memo: String,
        $accountId: ID!, 
        $resultCenterId: ID!) {
        addEntry(date: $date, value: $value, memo: $memo, accountId: $accountId, resultCenterId: $resultCenterId) {
          entry {
            id
            date
            value
            memo
            account {
              structure
            }
            resultCenter {
              name
            }
          }
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query, 
          variables: {date:"2020-09-01", value:100.00, memo:"this is a memo",
            accountId:account.id, resultCenterId:result_center.id})
          .as_json
    end

    it "creates an entry" do
      #puts result #uncomment to inspect object in prompt
      expect(result['data']['addEntry']['entry']['id']).to eq('1')
      expect(result['data']['addEntry']['entry']['date']).to eq('2020-09-01T00:00:00Z')
      expect(result['data']['addEntry']['entry']['value']).to eq(100.00)
      expect(result['data']['addEntry']['entry']['account']['structure']).to eq('account-1')
      expect(result['data']['addEntry']['entry']['resultCenter']['name']).to eq('center 1')
    end
  end

end
