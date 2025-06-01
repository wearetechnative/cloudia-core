defmodule Cloudia.Aws.Subnet do
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
    belongs_to(:vpc, Cloudia.Aws.Vpc)
    belongs_to(:az, Cloudia.Aws.Az)
    has_many(:ec2_instances, Cloudia.Aws.Ec2Instance)
  end

  json_api do
    type "subnet"
  end

end
