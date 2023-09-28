terraform {
  required_version = "~> 1.0"

  required_providers {
    bitbucket = {
      source = "DrFaust92/bitbucket"
      version = "2.35.0"
    }
  }
}

provider "bitbucket" {
  # (Optional) Username to use for authentication via Basic Auth. You can also set this via the 
  # BITBUCKET_USERNAME environment variable. If configured, requires password to be configured as well.
  username = "mike_hcm"

  # (Optional) Password to use for authentication via Basic Auth. Please note that this has to be an 
  # App Password that has to be created in the Account Settings. You can also set this via 
  # the BITBUCKET_PASSWORD environment variable. If configured, requires username to be configured as well.
  password = "ATBBCDnhcmaheKS9qx3d455KuK6HDAD4F008" # you can also use app passwords
 
  # (Optional) OAuth client ID to use for authentication via Client Credentials Grant. You can 
  # also set this via the BITBUCKET_OAUTH_CLIENT_ID environment variable. If configured, 
  # requires oauth_client_secret to be configured as well.
  
  #oauth_client_id = "OAUTH_CLIENT_ID" 
  
  # (Optional) OAuth client secret to use for authentication via Client Credentials Grant. You 
  # can also set this via the BITBUCKET_OAUTH_CLIENT_SECRET environment vsariable.
  # If configured, requires oauth_client_id to be configured as well.
  
  #oauth_client_secret = "OAUTH_CLIENT_SECRET"

  # (Optional) An OAuth access token used for authentication via OAuth. 
  # You can also set this via the BITBUCKET_OAUTH_TOKEN environment variable.
  
  #oauth_token = "OAUTH_TOKEN"
}
