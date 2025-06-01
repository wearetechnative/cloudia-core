defmodule Cloudia.Aws.Vpc do
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
    belongs_to(:region, Cloudia.Aws.Region)
    belongs_to(:aws_account, Cloudia.Aws.AwsAccount)
    has_many(:subnets, Cloudia.Aws.Subnet)
  end
end


