output "api_curl_endpoint" {
  description = "Endpoint to query the API"
  value       = module.pomelo_challenge.gateway_api_url
}