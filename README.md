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

Clone esse repositório e realize todas as modificações, depois que terminar, compacte o repositorio e nos envie. 
Mantenha o .git no arquivo compactado, queremos analisar os seus commits.
**Versão do Gradle: 4.10**

---

## **Pré-requisitos**

Pré-requisitos necessário para execução do desafio:
 Git - Terraform / tfenv - docker - Kind - Kubectl - java-17-openjdk - Gradle 4.10 - kotlin - Helm -  Metrics Server / Para auto scale

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
   Baixando o Tfenv:
   git clone https://github.com/tfutils/tfenv.git ~/.tfenv
   ```
2. Configuramdp:
   ```bash
   Adicionando a variavel de ambiente no bash_profile para poder chamar de qualquer diretório:
   echo 'export PATH="$HOME/.tfenv/bin:$PATH"' >> ~/.bash_profile
   ```
3. Auternativa para configurar:
   ```bash
   Auternativa ao bash profile:
   sudo ln -s ~/.tfenv/bin/* /usr/local/bin
   ```
4. Comando para instalação:
   ```bash
   tfenv -v
   ```
</details>
<details>
<summary>DOCKER</summary>

1. Adicione o repositório do Docker:
   ```bash
   sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
   ```
2. Com o repositório adicionado, instale o Docker, que é composto de três pacotes::
   ```bash
   sudo dnf install docker-ce docker-ce-cli containerd.io -y 
   ```
3. Após a conclusão da instalação, inicie o daemon do Docker e coloque na inicilização automatica::
   ```bash
   sudo systemctl start docker
   sudo systemctl enable docker
   sudo systemctl status docker
   ```
4. Executando o comando Docker sem Sudo (opcional):
   ```bash 
   Executando o comando Docker sem Sudo (opcional)
   Se você quiser evitar digitar sudo sempre que executar o comando docker, adicione seu nome de usuário ao grupo docker:
   sudo usermod -aG docker $(whoami)

   Se você precisar adicionar um usuário ao dockergrupo no qual não está logado, declare esse nome de usuário explicitamente usando:
   sudo usermod -aG docker nome_de_usuário_aqui
   ```
5. Ativando usuario sem root:
   ```bash
   OBS: Após a ação acime e necessario reiniciar o terminal.
   ```
</details>
<details>
<summary>KIND</summary>

1. Baixando o kind:
   ```bash
   [ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.27.0/kind-linux-amd64
   ```
2. Transformando o binario em executavel:
   ```bash
   chmod +x ./kind
   ```
3. Configurando o kind para responder com o usuário em quaquer diretório:
   ```bash
   sudo mv ./kind /usr/local/bin/kind 
   ou
   sudo ln -s ~/kind /usr/local/bin/kind
   ```
4. Para validar e verificar a versão:
   ```bash
   kind --versiono
   ```
</details>
<details>
<summary>KUBECTL</summary>

1. Baixando o kubectl:
   ```bash
   curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
   ```
2. Transformando o binario em executavel:
   ```bash
   chmod +x kubectl
   ```
3. Configurando o kubectl para responder com o usuário em quaquer diretório:
   ```bash
   sudo mv ./kubectl /usr/local/bin/kubectl
   ou
   sudo ln -s ~/kubectl /usr/local/bin/kubectl
   ```
4. Para validar e verificar a versão:
   ```bash
   kubectl version --output=yaml
   ```
</details>
<details>
<summary>JAVA</summary>

1. Para instalar o JDK , execute o seguinte comando:
   ```bash
   sudo apt-get install openjdk-17-jdk
   ```
2. Para verificar a instalação, execute o seguinte comando:
   ```bash
   java -version
   ```
3. Configurando o kubectl para responder com o usuário em quaquer diretório:
   ```bash
   sudo mv ./kubectl /usr/local/bin/kubectl
   ou
   sudo ln -s ~/kubectl /usr/local/bin/kubectl
   ```
4. Para validar e verificar a versão:
   ```bash
   kubectl version --output=yaml
   ```
</details>
<details>
<summary>GRADLE</summary>

1. Instalar o Gradle usando SDKMAN! (Recomendado):
   ```bash
   Instalar o SDKMAN!
   curl -s "https://get.sdkman.io" | bash
   ```
2. Após a instalação, execute o seguinte comando para carregar o SDKMAN! no seu shell:
   ```bash
   source "$HOME/.sdkman/bin/sdkman-init.sh"
   ```
3. Agora, instale o Gradle usando o SDKMAN!:
   ```bash
   sdk install gradle 4.10
   OBS: Versão 4.10 foi feito download do site "https://gradle.org/next-steps/?version=4.10&format=all"
   ```
4. Para validar e verificar a versão:
   ```bash
   gradle --version
   ```
</details>
<details>
<summary>KOTLIN</summary>

1. Instalar o Kotlin usando SDKMAN! (Recomendado):
   ```bash
   sdk install kotlin 1.9.10
   ```
2. Após a instalação, execute o seguinte comando para validar a versão:
   ```bash
   kotlin -version
   ```
</details>
<details>
<summary>HELM</summary>

1. Abaixo, segue comando para download do Helm:
   ```bash
   curl -fsSL https://get.helm.sh/helm-v3.16.1-linux-amd64.tar.gz -o helm-linux-amd64.tar.gz
   ```
   2. Extraido pacote
   ```bash
   tar -zxvf helm-linux-amd64.tar.gz
   ```
   3 Movendo par o /usr/local/bin/ para chamar o binario de qualque lugar no servidor.
   ```bash
   sudo mv linux-amd64/helm /usr/local/bin/helm
   ```
   4. Validando a instalação e versão:
   ```bash
   helm version
   ```
</details>
<details>
<summary>Grafahna e prometheus</summary>

1. OBS:
   ```bash
   Ambos serão instalados via receita terraform.
   ```
</details>

---

## **2. Buildando a aplicação**
<details>
<summary>GRADLE</summary>

1. Com o Gradle 4.10 instalado execute:
   ```bash
   Gradle inite - Ira verificar os pacotes e baixar os pendentes.
   Gradle build java application --continue  - Ira buikdar a app dando alguns bypass
   OBS: Provavelmnte será necessarios alguns troubleshooting
   ```
2. Validação:
   ```bash
   Ao concluir acesse o diretório /app/build/libs
   Valide que o arquivo app.jar foi criado.
   ```
</details>




--
Containerizando a Aplicação Kotlin

* Crie o Dockerfile:
vim Dockerfile

Adicione as segiontes linhas no docker file:

# Use uma imagem base com OpenJDK
FROM openjdk:17-jdk-slim as build

# Defina o diretório de trabalho dentro do container
WORKDIR /app

# Copie o arquivo JAR para dentro do container
COPY target/app.jar /app/app.jar

# Exponha a porta 8080 para o acesso externo
EXPOSE 8080

# Comando para rodar a aplicação
ENTRYPOINT ["java", "-jar", "/app/app.jar"]




