# Invitation manager

## 🚀 Instalando Invitation manager

```bash
git clone git@github.com:Dayanfreitas/invitation-manager.
```

```
cd invitation-manager
```

## ☕ Usando Invitation manager

Para usar Invitation manager, siga estas etapas:

### Docker 

Usando o docker para subir o projeto 

```bash
docker-compose up
```

Acesse o terminal docker 

```bash
docker exec -it app-invitation-manager /bin/bash
```

Rode o bundle 
```bash
bundle install
```
Faça as migrações do banco antes de subir aplicação

Para subir aplicação

```bash
rails s -p 3000 -b 0.0.0.0
```

### Usando o makefile 

Build do container

```
make up
```

Entrando no bash 
```bash
make bash
```

### Migrações

```bash
rails db:create
rails db:migrate
```

## Popular base 
Para popular base com dados 

1- Entre no no terminal do docker

2- Rode a task
```bash 
rails db:populate
```

A taks deve criar um usuário para teste

Usuário para teste:
```
user: dayan.freitas@test.com
login: 123456
```


# Views
* Home - /
* Administrations - /administrations
* Companies - /companies
* Convites - /invitations

# Api
Para usar o arquivo de de endpoint 
[Api doc](doc/Insomnia_2024-09-03.json)


### Rotas:

### api/v1/tokens
  
Para geração de token:


# Test
* Rspec
* 
```
rspec
```
