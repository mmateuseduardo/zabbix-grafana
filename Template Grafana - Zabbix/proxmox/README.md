## <p align="center">Proxmox :)
<p align="center">💻 Template do Proxmox<align="center"><br><br>
<img height="300" width="620"  src="https://github.com/mmateuseduardo/zabbix-grafana/blob/main/img/proxmox-cluster.png"/>
<img height="300" width="620"  src="https://github.com/mmateuseduardo/zabbix-grafana/blob/main/img/proxmox-pve1.jpeg"/>

## Sobre<br>
Este Template contem modificação no seu arquivo de zabbix e uma tela modelo para o grafana.<br><br>

## ✅ Suporte<br> 
Zabbix v7.2<br>
Grafana v9.2.5<br>

Observação: Para utilizar a função Disponivel no template do grafana, é necessário criar um item no zabbix com o nome do seu servidor cadastrador e o storage.
No meu caso foi utilizado o nome do host como pve2 e do storage como Bunker1.

last(//proxmox.node.maxdisk[pve2,Bunker1])-last(//proxmox.node.disk[pve2,Bunker1])

## 🤝 Contribuindo<br>
No momento, aceitamos contribuições para este repositório.<br>
Siga os passos abaixo para contribuir com a ferramenta digital:<br>

- 1.Faça um repositório.<br>
- 2.Desenvolva a nova funcionalidade ou faça as alterações que você acha que agregam valor à ferramenta<br>
- 3.Faça um "pull request" documentando detalhadamente as alterações propostas no repositório.<br><br>
Se você não contribuiu para o repositório, mas achou a ferramenta útil, adoraríamos ouvir sobre sua experiência. Conte-nos sobre sua experiência em um problema.**<br><br>

Atribuições<br>
Informe-nos no "pull request" seu nome de usuário e organização para adicioná-lo à lista de contribuições no Readme.md.<br>

## 📧 Contato
Link do Projeto: https://github.com/mmateuseduardo/script-backup<br>

## 📝 Licença
```
Este projeto está sob a licença do MIT.

```
