output "empty_repos" {
  value = bitbucket_repository.main[*].name
}

output "forked_repos" {
  value = bitbucket_forked_repository.main[*].name
}
