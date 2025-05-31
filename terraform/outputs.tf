output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}