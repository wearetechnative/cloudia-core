defmodule Cloudia.Aws.Az do
  use Ash.Resource,
    domain: Cloudia.Aws,
    extensions: [AshJsonApi.Resource],
    data_layer: Ash.DataLayer.Ets

  actions do
    defaults(	[:create, :read, :update, :destroy])
  end

  attributes do
    uuid_primary_key(:id)

    attribute :name, :string do
      allow_nil?(false)
      public?(true)
    end
  end

  relationships do
    has_many(:subnets, Cloudia.Aws.Subnet)
    belongs_to(:region, Cloudia.Aws.Region)
  end

  json_api do
    type "az"
  end

end


