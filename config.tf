module "config" {
  # using BitBucket as a source
  # source = "git::https://bitbucket.org/hubcitymedia/<project>-01-common-config.git"

  # local source
  source = "../01-common-config"
}
