# Instalação, rodando projeto e executando os testes automatizados

Instalação:
```sh
$ bundle install
$ rake db:create
$ rake db:migrate
```

Rodando o projeto:

```sh
# Iniciar o rails server
$  rails s
```

Rodando os testes automatizados:

```sh
$ rake db:create RAILS_ENV=test
$ rake db:migrate RAILS_ENV=test
$ rspec -fd

# Após rodar os testes automatizados é possível verificar o percentual de
# cobertura dos testes no arquivo 'coverage/index.html'
# Referência: https://github.com/colszowka/simplecov
```

Rodando verificações de padronização de código:

```sh
# https://github.com/rubocop-hq/rubocop
$ rubocop
```
