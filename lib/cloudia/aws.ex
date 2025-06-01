defmodule Cloudia.Aws do
  use Ash.Domain,
    extensions: [
      AshAdmin.Domain,
      AshJsonApi.Domain
    ]

  resources do
    resource Cloudia.Aws.AwsAccount
    resource Cloudia.Aws.Vpc
    resource Cloudia.Aws.Subnet
    resource Cloudia.Aws.Region
    resource Cloudia.Aws.Az
    resource Cloudia.Aws.Ec2Instance
  end

  admin do
    show? true
  end

  json_api do
    routes do
      base_route "/aws/aws_account", Cloudia.Aws.AwsAccount do
        get :read
        index :read
        post :create
      end

      base_route "/aws/az", Cloudia.Aws.Az do
        get :read
        index :read
        post :create
      end

      base_route "/aws/ec2_instance", Cloudia.Aws.Ec2Instance do
        get :read
        index :read
        post :create
      end

      base_route "/aws/region", Cloudia.Aws.Region do
        get :read
        index :read
        post :create
      end

      base_route "/aws/subnet", Cloudia.Aws.Subnet do
        get :read
        index :read
        post :create
      end

      base_route "/aws/vpc", Cloudia.Aws.Vpc do
        get :read
        index :read
        post :create
      end

    end
  end

end


