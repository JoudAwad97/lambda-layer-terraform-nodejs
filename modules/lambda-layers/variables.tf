variable "layer_name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "compatible_runtimes" {
  type = list(string)
}

variable "filename" {
  type = string
}

variable "compatible_architectures" {
  type = list(string)
}