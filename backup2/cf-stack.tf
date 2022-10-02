
locals {
  aws_vpc_stack_name          = "${var.aws_resource_prefix}-vpc-stack"
  aws_ecs_service_stack_name  = "${var.aws_resource_prefix}-svc-stack"
  aws_ecr_repository_name     = var.aws_resource_prefix
  aws_ecs_cluster_name        = "${var.aws_resource_prefix}-cluster"
  aws_ecs_service_name        = "${var.aws_resource_prefix}-service"
  aws_ecs_execution_role_name = "${var.aws_resource_prefix}-ecs-execution-role"
}




# resource "aws_cloudformation_stack" "vpc" {
#   name          = local.aws_vpc_stack_name
#   template_body = file("cloudformation-templates/public-vpc.yml")
#   capabilities  = ["CAPABILITY_NAMED_IAM"]
#   parameters = {
#     ClusterName       = "${local.aws_ecs_cluster_name}"
#     ExecutionRoleName = "${local.aws_ecs_execution_role_name}"
#   }
# }

# # Note: creates task definition and task definition family with the same name as the ServiceName parameter value
# resource "aws_cloudformation_stack" "ecs_service" {
#   name          = local.aws_ecs_service_stack_name
#   template_body = file("cloudformation-templates/public-service.yml")
#   depends_on    = [aws_cloudformation_stack.vpc, aws_ecr_repository.borough-market]

#   parameters = {
#     ContainerMemory = 1024
#     ContainerPort   = 80
#     StackName       = "${local.aws_vpc_stack_name}"
#     ServiceName     = "${local.aws_ecs_service_name}"
#     # Note: Since ImageUrl parameter is not specified, the Service
#     # will be deployed with the nginx image when created
#   }
# }