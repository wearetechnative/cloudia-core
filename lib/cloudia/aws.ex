defmodule Cloudia.Aws do
  use Ash.Domain, extensions: [AshAdmin.Domain]

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
end


