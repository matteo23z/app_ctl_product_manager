# ctl_product_manager - Projeto App Mobile 

![controp logo](https://user-images.githubusercontent.com/69529755/100896259-3219e600-349d-11eb-8997-4cb5530d9402.png)

## Informações
- Projeto do Curso de Análise e Desenvolvimento de Sistemas da Universade São Fancisco (USF) de Itatiba - SP;
- Disciplina: Desenvolvimento para Sistemas Móveis;
- Monitorado pelo Professor Matias Filho;
- Criado por Matteo Figueiredo da Silva;

## Objetivo

Projeto voltado para criação de um app mobile que irá monitorar o estoque de produtos do usuário, como por exemplo: alimentos, e monitorar também suas datas de validade para relizar um controle fácil e rápido, e auxiliar na repocição mensal desses produtos. 

## Tecnologias
- Linguagem: Dart (Flutter);
- Banco de Dados: Firebase;

## Como Funciona
**Introdução:** O app cria dispensas que podem adiministrar uma lista de produtos, dispensas na qual o usuário poderá organizar da sua maneira, como por exemplo: separar cada uma com um tipo de produto diferente. E na lista as validades são verificadas, e se algum dos produtos já passou da sua data de vencimento os cards dos mesmos ficam vermelhos ou amarelos se faltarem 30 dias para o vencimento, alertando visualmente o usuário.

#### Tudo começa fazendo o login ou cadastro no app.
#### Logo após irá entrar na tela inicial, e para criar um dispensa é só arrastar para o lado ou clicar no icone que se encontra na parte superior à esqueda e clicar no botão Criar Nova Dispensa.
#### Com a dispensa criada, cliando nela irá entrar na tela de lista de produtos, onde com o botão flutuante na parte inferior à direita é onde será criado um produto nessa dispensa.
#### Para criar um produto, somente deve ser inserido os dados nos campos e clicar em inserir, pronto produto criado.

## Planos Futuros
### Código
O app está pesado, com mais de 100 Mb como mostra na imagem acima.É preciso fazer:
- Melhorias de código na estrutura view;
- Implementar melhor o modelo MVC.

### Banco de Dados
- Melhorar a estrutura das coleções para disponibilizar uso do app do público.

### Usabilidade
- Implementar login com a conta do google;
- Implemetar a criação das dispensas;
- Cricação da tela de introdução para o usuário ao abrir o app pela primeira a vez, contendo informações de como funciona o app, para não ficar perdido;
- Criação da tela de edição dos produtos;
- Criação da tela de configurações, dúvidas, e informações;
- Criação de notificações para comunicar informações com o usuário;
- Implemetar um botão rápido de atualização da quantidade do produto;
- Terminar de implemetar a classe que redimenciona a tela do app (appSize.dart);
