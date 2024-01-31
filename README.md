# Contexto
Tenho estudado uma forma de montar um data mesh utilizando modern data stack e resolvi fazer uma atualização nos meus conhecimentos e encontrei o curso de <a href="https://www.datascienceacademy.com.br/course/arquitetura-de-plataforma-de-dados-e-modern-data-stack">Arquitetura de Plataforma de Dados e Modern Data Stack</a> da Data Science Academy nele subimos uma instancia de Redshift e fizemos algumas analises em um dos projetos do curso e para complementar meu conhecimento e criar a infra estrutura de um dos componentes da plataforma de dados resolvi criar um projeto em Terraform que implementa uma instancia de Redshift Serverless na AWS.

Este é o primeiro componente da Plataforma.

Em breve vou subir a implementação do MWAA( AirFlow Gerenciado ) como componente de Orquestração.

# O Que é um Serverless Data Warehouse ?
Um "Serverless Data Warehouse" é um tipo de solução de armazenamento de Dados que elimina a necessidade de gerenciamento de infraestrutura de servidor por parte do usuário.

Em um Ambiente serverless, o provedor de serviço gerencia a infra estrutura, permitindo que os usuários se concentrem mais no armazenamento, processamento e análise de dados, sem se preocuparem com a manutenção do hardware ou do sistema operacional.

### Componente chave
- **Elasticidade Automática:** A Capacidade de escalar recursos de forma automática e em tempo real, dependendo da demanda de carga de trabalho.
- **Gestão da Infraestrutura:** O Provedor do serviço gerencia a infraestrutura, incluindo servidores, redes e sistemas operacionais.
- **Modelo de Pagamento por Uso:** Os custos são baseados no consumo real de recursos, sem a necessidade de investimento em hardware.
- **Integração com Ferramentas de Análise e BI:** Facilidade de integração com ferramentas de Business Inteligence (BI) e analise de Dados

### Vantagens 
- **Custo-Eficiência:** Reduz custos operacionais e de Capital, pois não há necessidade de comprar e manter hardware.
- **Flexibilidade e Excalabilidade:** Permite escalar recursos rapidamente para lidar com picos de demanda sem interrupções ou atrasos.
- **Manutenção e Atualizações Automatizadas:** O provedor cuida da manutenção e das atualizações, garantindo que o sistema esteja sempre atualizado e seguro.
- **Foco no Uso dos Dados:** Os usuários podem se concentrar na análise e no uso dos dados, em vez de se preocuparem com questões de infraestrutura.
- **Tempo de Implementação Reduzido:** Permite uma implementação mais rápida de soluções de armazenamento e analise de dados.
- **Acessibilidade:** Facilita o acesso a poderosas capacidades de armazenamento e processamento de dados para empresas de  todos os tamanhos.

### Aplicações
- Ideal para empresas que lidam com grandes volumes de dados e precisam de analise em tempo real.
- Suporta soluções avançadas de BI sem a complexidade de gerenciar infraestrutura.
- Oferece uma Solução de armazenamento Flexivel e escalável na nuvem.

### Exemplos
- **Google BigQuery:** Um exemplo popular de um data warehouse serverless que oferece armazenamento e análise de dados em grande escala com gerenciamento mínimo de infraestrutura.
- **Amazon Redshift Serverless:** Outra solução serverless que permite aos usuários executar análise de dados sem gerenciar a infraestrutura.

## Como utizar os códigos

- Clone este repositorio
- Instale o Terraform( https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli )
- Crie um arquivo.tfvar e preencha com as variaveis
```terraform
region                  = [Região que vai ser criado os recursos]
account_id              = [id da conta da AWS]
bucket_name             = [nome do bucket para colocarmos os dados a serem importados]
app_name                = [Nome da Aplicação]
app_environment         = [Ambientende da Aplicação]
namespace_name          = [Nome da Instancia do Redshift]
database_name           = [Nome da Base de dados a ser criada e utilizada]
admin_username          = [Nome do usurio Admim da Instancia do Redshift]
admin_password          = [Senha de Admin da Instancia do Redshift]
redshift_workgroup_name = [Workgroup da Instancia do Redshift]
base_capacity           = [RPUs da instancia]
acasso_publico_redshift = [A INstancia do Redshift vai ser publica? default False]
```
- Crie o par de chaves na AWS( https://docs.aws.amazon.com/pt_br/IAM/latest/UserGuide/id_credentials_access-keys.html )
- Abra o Terminal e digite os comandos:
```bash
export AWS_ACCESS_KEY_ID=[Access Key criada na AWS]
export AWS_SECRET_ACCESS_KEY=[Secret Key criada na AWS]
terraform init
terraform plan -out plan.out
terraform apply plan.out
```
## Próximos passos
Embreve vou liberar um repositorio com o MWAA( AirFlow ) e vamos utilizar ele para levar os dados do S3 para o ReadShift