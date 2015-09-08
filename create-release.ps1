$headers = @{
  "Authorization" = "Bearer $env:gh_token"
  "Content-type" = "application/json"
  "Accept" = "application/vnd.github.v3+json"
}

$body = ConvertTo-Json @{
  "tag_name" = "$env:appveyor_build_version"
  "target_commitish" = "$env:appveyor_repo_commit"
  "name" = "$env:appveyor_build_version"
  "draft" = $false
  "prerelease" = $false
}

Invoke-RestMethod -Uri 'https://api.github.com/repos/FeodorFitsner/WebJob-Appevyor/releases' -Headers $headers -Method Post -Body $body
