variable "region" {
  description = "Região onde os recursos serão criados na AWS"
  type        = string
}

variable "account_id" {
  description = "ID da conta na AWS"
  type        = string
}

variable "bucket_name" {
  description = "Nome do Bucket de Configuração do MWAA"
  type        = string
}
#------------------------------------------------
# ###### Variaveis de Aplicação #################
#------------------------------------------------
variable "app_name" {
  type        = string
  description = "Nome da Aplicação"
}

variable "app_environment" {
  type        = string
  description = "Ambientende da Aplicação"
}


#------------------------------------------------
# ############## VARIAVEIS DE REDE ##############
#------------------------------------------------
variable "vpc_cidr" {
  default     = "10.20.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "subnet_cidr_blocks" {
  default     = ["10.20.1.0/24", "10.20.2.0/24", "10.20.3.0/24"]
  type        = list(any)
  description = "List of public subnet CIDR blocks"
}

variable "namespace_name" {
  type        = string
  description = "Nome da Instancia do Redshift"
}
variable "database_name" {
  type        = string
  description = "Nome da Base de dados a ser criada e utilizada"
}

variable "admin_username" {
  type        = string
  description = "Nome do usurio Admim da Instancia do Redshift"
}

variable "admin_password" {
  type        = string
  description = "Senha de Admin da Instancia do Redshift"
}

variable "redshift_workgroup_name" {
  type        = string
  description = "Workgroup da Instancia do Redshift"
}

variable "base_capacity" {
  type        = string
  description = "RPUs da instancia"
}

variable "acasso_publico_redshift" {
  type        = bool
  description = "A INstancia do Redshift vai ser publica? default False"
  default     = false
}
