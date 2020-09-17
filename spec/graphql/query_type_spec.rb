require "rails_helper"

RSpec.describe Types::QueryType do

  describe "result_centers" do
    let!(:result_centers) { create_pair(:result_center) }

    let(:query) do
      %(query {
        resultCenters {
          name
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query).as_json
    end

    it "returns all centers" do
      #puts result #uncomment to inspect object in prompt
      expect(result.dig("data", "resultCenters")).to match_array(
        result_centers.map { |cr| { "name" => cr.name } }
      )
    end
  end

  describe "accounts" do
    let!(:accounts) { create_pair(:account) } #let! não é lazy; let é lazy
    #First, we create a pair of items in our database. (create_pair é da library factory_bot)

    let(:query) do
      %(query {
        accounts {
          structure
          name
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query).as_json
    end

    it "returns all accounts" do
      #puts result #uncomment to inspect object in prompt
      expect(result.dig("data", "accounts")).to match_array(
        accounts.map { |a| { "structure" => a.structure, "name" => a.name } }
      )
    end
    #nota: dig navega na hash; como retorno é {data:{accounts:{...}}}, então já sabe
    #nota: map deve ser igual react (pra cada elemento no array...)
  end

  describe "entries" do
    let!(:entries) { create_pair(:entry) }

    let(:query) do
      %(query {
        entries {
          date
          value
          memo
        }
      })
    end

    subject(:result) do #significa: o subject (objeto do teste) vai ser o resultado da query (json); sem isso, seria QueryType.new
        TestrailsSchema.execute(query).as_json
    end

    it "returns all entries" do
      #puts result #uncomment to inspect object in prompt
      expect(result.dig("data", "entries")).to match_array(
        entries.map { |e| { 
          "date" => e.date, 
          "value" => e.value, 
          "memo" => e.memo
          }
        }
      )
    end
  end

end

#TODO teste entry.clipped_memo - quary funciona, mas o teste precisa ser mudado, pq nao acha campo, pois nao eh da entidade
#TODO teste me (current user)