Vamos dar uma olhada em group_vars e host_vars?

Não tem segredo, quando executarmos o ansible-playbook o ansible irá procurar por algumas pastas no diretório
onde você executou o playbook. Ele irá procurar pela a pasta group_vars e host_vars.

Dentro dela o ansible irá procurar por uma pasta ou um arquivo que dê match no host que o playbook está executando no momento,
ou seja, se tiver algo assim no playbook `hosts: dev` o ansible-playbook irá procurar por:
/<playbook-folder>/group_vars/dev.{'.yml', '.yaml', '.json'} # Irá procurar por essas extenções
/<playbook-folder>/group_vars/dev/*.{'.yml', '.yaml', '.json'} # '*' Significa qualquer coisa
/<playbook-folder>/host_vars/<hostname>.{'.yml', '.yaml', '.json'}
/<playbook-folder>/host_vars/<hostname>/*.{'.yml', '.yaml', '.json'}

Se o inventario for:
```
[dev]
192.168.56.5
```

o host_vars ficaria assim:
/<playbook-folder>/host_vars/192.168.56.5.{'.yml', '.yaml', '.json'}
/<playbook-folder>/host_vars/192.168.56.5/*.{'.yml', '.yaml', '.json'}

podemos ver isso em ação sem termos um playbook também! Isso é muito util quando queremos debugar algo no dia a dia
podemos executar:

ansible-inventory -i inventory --vars --list
E dentro do "hostvars" teremos as variáveis que cada host irá carregar consigo
``` yaml
"hostvars": {
    "192.168.56.15": {
        "ansible_ssh_private_key_file": "~/.vagrant.d/insecure_private_key",
        "ansible_ssh_user": "vagrant",
        "env": "hom"
    },
    "192.168.56.25": {
        "ansible_ssh_private_key_file": "~/.vagrant.d/insecure_private_key",
        "ansible_ssh_user": "vagrant",
        "env": "testando"
    },
    "192.168.56.5": {
        "ansible_ssh_private_key_file": "~/.vagrant.d/insecure_private_key",
        "ansible_ssh_user": "vagrant",
        "env": "dev"
    }
}
```

Podemos ver que a variavel env é dev, hom e testando... não deveria ser prod?
Consegue me dizer o porquê disso?
