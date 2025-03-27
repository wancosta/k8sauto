# Challenge - Kubernetes

## Sobre o Desafio: 

Esse é um teste feito para conhecer um pouco mais de cada candidato. 
Não é um teste objetivo e não há apenas uma solução que consideramos correta. 
O intuito é ser um estudo de caso com o propósito de conhecer o seu modo de trabalhar.

## Introdução

Temos neste repositório uma aplicação em Kotlin simples com uma API REST que responde um Hello World quando recebe um GET na porta 8080. (ex: curl http://localhost:8080/)

* Containerize essa aplicação
* Crie um Helm chart contendo os manifestos necessários para essa aplicação rodar em um cluster Kubernetes local (use minikube ou kind para fazer o spin-up desse cluster local)
* Utilizando Terraform, realize o deploy da app no cluster.

## Algumas dicas que podem ser importantes:

* Invista tempo em escrever uma documentacão de qualidade
* Empregue quaisquer boas práticas que achar conveniente 
* Organize seu código
* Seja eficiente e simples
* Uso de módulos no terraform será considerado um plus

## Entrega do desafio:

Clone esse repositório e realize todas as modificações, depois que terminar, compacte o repositorio e nos envie. Mantenha o .git no arquivo compactado, queremos analisar os seus commits.
 **Versão do Gradle: 4.10**

---

## **Pré-requisitos**

Pré-requisitos necessário para execução do desafio:
 Git - Terraform / tfenv - ocker - Kind - Kubectl - java-17-openjdk - Gradle 4.10 - kotlin - Helm -  Metrics Server / Para auto scale

---

## **1. Instalação Requisitos**
<details>
<summary>GIT</summary>

1. Comando para instalação:
   ```bash
   sudo dnf install git -y
   ```
2. Validação:
   ```bash
   git --version
   ```
</details>
<details>
<summary>TFENV</summary>

1. Comando para instalação:
   ```bash
   sudo dnf install git -y
   ```
2. Validação:
   ```bash
   git --version
   ```
</details>






<summary>tfen / terraform</summary>
1. Comando para instalação:
   ```bash
   Baixando o Tfenv:
   git clone https://github.com/tfutils/tfenv.git ~/.tfenv
   ```
2. Configurando:
   ```bash
   Adicionando a variavel de ambiente no bash_profile para poder chamar de qualquer diretório:
   echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
   ```
3. Auternativa:
   ```bash
   Auternativa ao bash profile:
   sudo ln -s ~/.tfenv/bin/* /usr/local/bin
   ```
4. Auternativa:
   ```bash
   Comando para validação:
  tfenv -v
   ```   
</details>








Auternativa ao bash profile:
sudo ln -s ~/.tfenv/bin/* /usr/local/bin

Comando para validação:
tfenv -v




































