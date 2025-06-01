defmodule Cloudia.Aws.AwsAccount do
  use Ash.Resource,
    domain: Cloudia.Aws,
    extensions: [AshJsonApi.Resource],
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults(	[:read, :update, :destroy])

     create :create do
      accept([:name, :account_id])
    end
  end

  attributes do
    uuid_primary_key(:id)

    attribute :account_id, :integer do
      allow_nil?(false)
      public?(true)
    end

    attribute :name, :string do
      allow_nil?(false)
      public?(true)
    end
  end

  relationships do
    has_many(:vpcs, Cloudia.Aws.Vpc)
  end

  json_api do
    type "aws_account"
  end

end



