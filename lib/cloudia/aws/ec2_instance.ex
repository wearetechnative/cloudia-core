defmodule Cloudia.Aws.Ec2Instance do
  use Ash.Resource,
    domain: Cloudia.Aws,
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
    belongs_to(:subnet, Cloudia.Aws.Subnet)
  end
end

