output "alb_dns_name" {
  value = aws_lb.app_alb.dns_name
}

output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.app_cf.domain_name
}
