output "alb_arn" {
  description = "ARN of the ALB itself. Useful for debug output, for example when attaching a WAF."
  value       = "${element(concat(aws_alb.with_logs.*.arn, aws_alb.without_logs.*.arn ,list("")), 0)}"
}

output "alb_arn_suffix" {
  description = "ARN suffix of our ALB - can be used with CloudWatch"
  value       = "${element(concat(aws_alb.with_logs.*.arn_suffix, aws_alb.without_logs.*.arn_suffix ,list("")), 0)}"
}

output "alb_dns_name" {
  description = "The DNS name of the ALB presumably to be used with a friendlier CNAME."
  value       = "${element(concat(aws_alb.with_logs.*.dns_name, aws_alb.without_logs.*.dns_name, list("")), 0)}"
}

output "alb_id" {
  description = "The ID of the ALB we created."
  value       = "${element(concat(aws_alb.with_logs.*.id, aws_alb.without_logs.*.id ,list("")), 0)}"
}

output "alb_listener_https_arn" {
  description = "The ARN of the HTTPS ALB Listener we created."
  value       = "${element(concat(aws_alb_listener.frontend_https.*.arn, list("")), 0)}"
}

output "alb_listener_http_arn" {
  description = "The ARN of the HTTP ALB Listener we created."
  value       = "${element(concat(aws_alb_listener.frontend_http.*.arn, list("")), 0)}"
}

output "alb_listener_https_id" {
  description = "The ID of the ALB Listener we created."
  value       = "${element(concat(aws_alb_listener.frontend_https.*.id, list("")), 0)}"
}

output "alb_listener_http_id" {
  description = "The ID of the ALB Listener we created."
  value       = "${element(concat(aws_alb_listener.frontend_http.*.id, list("")), 0)}"
}

output "alb_zone_id" {
  description = "The zone_id of the ALB to assist with creating DNS records."
  value       = "${element(concat(aws_alb.with_logs.*.zone_id, aws_alb.without_logs.*.zone_id ,list("")), 0)}"
}

output "principal_account_id" {
  description = "The AWS-owned account given permissions to write your ALB logs to S3."
  value       = "${data.aws_elb_service_account.main.id}"
}

output "target_group_arn" {
  description = "ARN of the target group. Useful for passing to your Auto Scaling group module."
  value       = "${aws_alb_target_group.target_group.arn}"
}
