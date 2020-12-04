# ctl_product_manager - Projeto App Mobile 

![controp logo](https://user-images.githubusercontent.com/69529755/100896259-3219e600-349d-11eb-8997-4cb5530d9402.png)

## Informações
- Projeto do Curso de Análise e Desenvolvimento de Sistemas da Universidade  São Francisco (USF) de Itatiba - SP;
- Disciplina: Desenvolvimento para Sistemas Móveis;
- Monitorado pelo Professor Matias Filho;
- Criado por Matteo Figueiredo da Silva;

## Objetivo

Projeto voltado para criação de um app mobile que irá monitorar o estoque de produtos do usuário, como por exemplo: alimentos, e monitorar também suas datas de validade para relizar um controle fácil e rápido, e auxiliar na repocição mensal desses produtos. 

## Tecnologias
- Linguagem: Dart (Flutter);
- Banco de Dados: Firebase;
- Codificador: VScode;
- Metodologia Ágil com Trello.

## Como Funciona
**Introdução:** O app cria dispensas que podem adiministrar uma lista de produtos, dispensas na qual o usuário poderá organizar da sua maneira, como por exemplo: separar cada uma com um tipo de produto diferente. E na lista as validades são verificadas, e se algum dos produtos já passou da sua data de vencimento os cards dos mesmos ficam vermelhos ou amarelos se faltarem 30 dias para o vencimento, alertando visualmente o usuário.

#### Tudo começa fazendo o login ou cadastro no app.
![Entrar no App](https://user-images.githubusercontent.com/69529755/101015018-84164680-3545-11eb-89b6-43a308e40d72.png)
#### Logo após irá entrar na tela inicial, e para criar um dispensa é só arrastar para o lado ou clicar no icone que se encontra na parte superior à esqueda e clicar no botão Criar Nova Dispensa.
![Tela Inicial e dispensa](https://user-images.githubusercontent.com/69529755/101016129-1a973780-3547-11eb-94d6-10d996e80bb0.png)
#### Com a dispensa criada, cliando nela irá entrar na tela de lista de produtos, onde com o botão flutuante na parte inferior à direita é onde será criado um produto nessa dispensa.
![Lista de Produtos](https://user-images.githubusercontent.com/69529755/101015536-57166380-3546-11eb-9c29-a9de1eb9ca40.png)
> Nessa Tela também será realizado busca com a barra de busca, exclução clicando no botão da lixeira ou edição clicando no botão com formato de lápis.
#### Para criar um produto, somente deve ser inserido os dados nos campos e clicar no botão "criar", pronto produto criado.
![Criar Produto](https://user-images.githubusercontent.com/69529755/101015522-5251af80-3546-11eb-94b0-e10754d7c7f7.png)
> Nessa tela possui um leitor de código de Barras para coleta mais rápida, e no futuro os dados inseridos referente ao codigo de barras será armazenado e ao ler o código novamente os dado dos produtos vão vir junto e popular os campos.
![Codigo de barras](https://user-images.githubusercontent.com/69529755/101018773-bd9d8080-354a-11eb-9042-6a94235a058a.png)

## Planos Futuros
### Código
![Informações do app](https://user-images.githubusercontent.com/69529755/101015848-c12f0880-3546-11eb-9b48-41f21333b972.png)

O app está pesado, com mais de 100 Mb como mostra na imagem acima.É preciso fazer:
- Melhorias de código na estrutura view;
- Implementar melhor o modelo MVC;
- Revisar todo o código para achar mais melhorias.

### Banco de Dados
- Melhorar a estrutura das coleções para disponibilizar uso do app ao público.

### Usabilidade
- Implementar login com a conta do google;
- Implemetar a criação das dispensas;
- Cricação da tela de introdução para o usuário ao abrir o app pela primeira a vez, contendo informações de como funciona o app, para não ficar perdido;
- Criação da tela de configurações, dúvidas, e informações;
- Criação de notificações para comunicar informações com o usuário;
- Implemetar um botão rápido de atualização da quantidade do produto;
- Terminar de implemetar a classe que redimenciona a tela do app (appSize.dart);
- Terminar de implemetar a tela de edição dos produtos;
- Terminar de implemetar a a barra de busca;
- Terminar de implemetar a tela de menu nas outras telas;

### Design
- Melhorias de interface;
- Tirar o logo do flutter e colocar a logo do app;
- Colocar mais detalhes nas telas;
- Colocar transcrições entre as telas.
