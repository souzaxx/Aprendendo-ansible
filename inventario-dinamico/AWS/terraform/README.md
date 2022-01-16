# Inventário Dinâmico

## Antes de qualquer coisa
Para executar esse código eu espero que você tenha configurado um profile na AWS.
Se for sua primeira vez vá no console da AWS e procure por IAM
em IAM você vai em usuário, procure pelo seu usuário e clique em credenciais de segurança.
Clique em `Criar chave de acesso` e salve o access_key e o secret_key

instale o [aws_cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
e rode: `aws configure`

Siga os passos do comando e você terá o provider `default` em ~/.aws/credentials

## Crie o nosso ambiente:

Use esse profile no arquivo profile.tf
```
terraform init
terraform plan
terraform apply --auto-approve
```
