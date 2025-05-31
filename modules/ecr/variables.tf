variable "repository_name" {
    description = "The name of the ECR repository"
    type        = string
}

variable "image_tag_mutability" {
    description = "The tag mutability setting for the repository. Valid values are MUTABLE or IMMUTABLE."
    type        = string
    default     = "MUTABLE"
}

variable "force_delete" {
    description = "If true, will delete the repository even if it contains images."
    type        = bool
    default     = false
}

variable "scan_on_push" {
    description = "Indicates whether images are scanned after being pushed to the repository."
    type        = bool
    default     = true
}

variable "tags" {
    description = "A map of tags to assign to the resource."
    type        = map(string)
    default     = {}
}
