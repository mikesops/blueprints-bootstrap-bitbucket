# Blueprints: Bitbucket Bootstrap

> Represents a project to setup initial global bitbucket repositories for a blueprints 
> deployment.

## Introduction

This project can be used to setup the required global SCM repositories
in BitBucket. It is meant to be used as a root module and and currently
deploys all resources directly.  Those resource definitions will be 
migrated to module calls in the futureleverages modules from the
[terraform-modules repository][terraform-module-repo-url].

This project creates the following resources (non-exhaustive list):
- 01-common-config repository
- 10-project
- 11-network
- 12-eks
- 20-kubernetes
- 30-cyberark
- 31-forgeops
  
## Prerequisites

This project requires the `01-common-config` to be setup first. The common
config project provides the required metadata information.

Check the `blueprints-common-config` [README.md][blueprints-common-config-url] for more details

## Usage

***UNDER CONSTRUCTION***

1. Clone* this repository

    ```bash
    # using Bitbucket as SCM
    git clone https://bitbucket.org/hubcitymedia/blueprints-bootstrap-bitbucket 02-bitbucket

    # using Github as SCM
    git clone https://github.com/<user/blueprints-bootstrap-bitbucket 02-bitbucket

    # remove .git dir
    cd 02-bitbucket
    rm -rf .git

    # add origin (UPDATE THE LOCATION/URL!)
    # using Bitbucket as SCM
    git remote add origin https://bitbucket.org/hubcitymedia/<project>-02-bitbucket (or name of choice)

    ```

2. 
3. Open the `config.tf` and ensure the source URL is correct. This URL should
   point to the `01-commmon-config` repository. See [prerequisites](#prerequisites) for 
   details about the common config repository.
4. Open the `_variables.tf` file and setup the prod and/or nonprod workspaces. Note
   that the assumption is that products will want to setup the same
   configuration for any environment in the account. Leave the "roles"
   configuration as is if there is no requirement to be able to assume the
   roles. Check the [aws/project][project-module-url] documentation for more
   details.
5. Login to AWS using aws cli, e.g. `aws sso login`.
6. Run terraform to create the resources:

   Basic Configuration with no state replication
   ```bash
    # 1. Execute from global workspace:
    terraform init
    terraform workspace new nonprod
    terraform apply
    ```


Before destroying any resources created with this project, make sure to:


## Contributions are Welcome

To contribute to this repository, please refer to the
[CONTRIBUTING.md][contributing-url] guide. 

[contributing-url]: CONTRIBUTING.md
[terraform-module-repo-url]: <https://bitbucket.org/hubcitymedia/terraform-modules>
[blueprints-common-config-url]: <https://bitbucket.org/hubcitymedia/blueprints-aws-common-config>
