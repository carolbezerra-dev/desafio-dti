# desafio-dti

Olá!
Nesse repositório você vai encontrar a solução do desafio técnico, etapa do processo seletivo da dti, para vaga de Desenvolvimento IOS

## Branch bonus

Optei por colocar o código com api local nessa branch, pois as requisições estão sendo realizadas com mock, assim não há interferência no comportamento da aplicação principal que está funcionando com UserDefaults

### Tecnologia usada
- Cocoapods
- Alamofire v5.7
- NodeJS v18.16.1
- Express

### Comandos que podem ser úteis

Para instalar `Cocoapods` 
```
sudo gem install cocoapods

pod setup --verbose

pod init
```
Para fazer download do `NodeJS`, acesse `https://nodejs.org/en`  
Inicie pacote `NodeJS` com 
```
npm init -y
```
Para instalar `Express`, use
````
npm i express@4.17.1 --save-exact
````
Para instalar `nodemon`, use
````
npm i nodemon@2.0.15 --save-dev --save-exact
````
Para iniciar a api, você pode usar
````
npm start
ou
npm run dev
````
(o segundo, mantém aplicação sendo atualizada, enquanto o primeiro é preciso encerrar e iniciar novamente para visualizar alteração)

### Como está organizada api

A porta usada é a `3001`  
Url padrão ficou `http://localhost:3001/posts`

Método `GET`, possui 2 rotas, ambas com mock:
-  `/` que retorna uma lista simples de apenas 1 item
-  `/posts` que retorna também retorna uma lista, só que com 2 itens

Método `POST`, adiciona a lista recebida no body (caso teste com um software como Insomnia, por exemplo)

No app, existe a camada `Service` onde as requisições estão sendo feitas  
Usei `Alamofire` para `GET` e `POST`, ambos estão printando informação no console  
Estão sendo trigadas durante a aplicação através da ViewModel:
- `GET` na função `get()` da `PostsViewModel`, chamada assim que a aplicação inicia
- `POST` na função `addNew()` da `AddPostViewModel`, chamada ao adicionar um novo post

## Considerações finais
Excelente proposta de desafio!  
Foi possível aplicar vários dos meus conhecimentos, ao mesmo tempo pude aprender novas abordagens também. Fiquei muito feliz em realizá-lo  
Certamente é algo que quero ter no meu portfólio.  
Espero que goste e me coloco [à disposição](https://www.linkedin.com/in/carolbezerra-dev/) para dúvidas e/ou sugestões de melhoria (sempre bem-vindas).
