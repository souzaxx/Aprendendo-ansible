Ad hoc do latim "para isso" ('to this') é um jeito de testar modulos do ansible
A sintaxe é bem simples
`ansible <hosts> -i <inventario> -m <modulo> -a <argumentos do modulo>`

Para seguir esse tutorial eu espero que você tenha seguido o README do folder anteriror [Colocar o link]

```
# O ansible espero que você passe um invetário como um arquivo (iremos ver mais sobre isso nos próximos exemplos
# porém o ansible aceita que você passe os hosts separados por virgula ( não use assim, é só para mostrar mesmo )
ansible 192.168.56.5 -i "192.168.56.5," --key-file="~/.vagrant.d/insecure_private_key" -u vagrant -m command -a "hostname"
# Por padrão o ansible usará o modulo `command`, então podemos simplicar o comando deste jeito:
ansible 192.168.56.5 -i "192.168.56.5," --key-file="~/.vagrant.d/insecure_private_key" -u vagrant -a "hostname"
# Podemos também testar outros modulos do ansible, como por exemplo o `apt`
# Para instalar pacotes com o apt você precisa ter privilegios para isso, o argumento -b faz com que o ansible assuma o user root na maquina.
ansible 192.168.56.5 -i "192.168.56.5," --key-file="~/.vagrant.d/insecure_private_key" -u vagrant -b -m apt -a "name=nginx state=present"
# Se quiser saber mais quais argumentos o modulo apt aceita, de uma olhada na (documentação oficial)[https://docs.ansible.com/ansible/latest/collections/ansible/builtin/apt_module.html]
```

PS: Se os comandos não funcionar verifique se o IP está correto, algumas instalações do virtualbox vem com ranges diferentes de `192.168.56.0/24`

