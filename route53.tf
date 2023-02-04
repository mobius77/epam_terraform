resource "aws_route53_record" "subdomain-for-test" {
  zone_id = "Z01002213NIE3APYTM5XX"
  name    = "test.mobiusz.tk"
  type    = "A"
  alias {
    name                   = aws_instance.my_project_instance.public_dns
    zone_id               = aws_route53_record.subdomain-for-test.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "subdomain-for-prod" {
  zone_id = "Z01002213NIE3APYTM5XX"
  name    = "prod.mobiusz.tk"
  type    = "A"
  alias {
    name                   = aws_instance.my_project_instance_prod.public_dns
    zone_id               = aws_route53_record.subdomain-for-prod.zone_id
    evaluate_target_health = true
  }
}