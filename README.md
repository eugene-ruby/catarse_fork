# Локальное развертывание проекта

## Установка PostgreSQL

```bash
brew install postgresql
brew services start postgresql
```

Запуск консоли psql для SQL команд, если не заход попробуй `createuser -s postgres`
```sql
 psql -d postgres
```


## Установка необходимых инструментов

Если инструменты не установлены, выполните следующие команды:

```bash
xcode-select --install
brew install gcc cmake pkg-config
brew install chruby
brew install ruby-install
```

Добавьте в `~/.zshrc`:

```bash
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
```

Затем обновите конфигурацию:

```bash
source ~/.zshrc
```

Установите и активируйте Ruby:

```bash
ruby-install ruby 3.1.6
chruby 3.1.6
```

## Создание базы данных

Файл конфигурации `config/database.yml`

Создайте пользователя и базы данных:

```sql
CREATE USER catarse WITH PASSWORD 'example';
CREATE DATABASE catarse_db;
CREATE DATABASE catarse_test;
GRANT ALL PRIVILEGES ON DATABASE catarse_db TO catarse;
GRANT ALL PRIVILEGES ON DATABASE catarse_test TO catarse;
ALTER DATABASE catarse_db OWNER TO catarse;
```

## Установка зависимостей

### Установка Python 2

Установите и настройте Python 2:

```bash
brew install pyenv
pyenv install 2.7.18
```

Добавьте в `~/.zshrc`:

```text
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
```

Обновите конфигурацию и установите локальную версию Python:

```bash
source ~/.zshrc
pyenv local 2.7.18
export PYTHON=$(pyenv which python)
python2 --version # должна быть версия 2
```

### Установка Node.js

Установите Node.js и Yarn:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.2/install.sh | bash
nvm install 10
nvm use 10
npm install -g yarn
npm install
```

## Сборка проекта

### Установка gems и миграция базы данных

Установите необходимые gems и выполните миграции:

```bash
bundle install
bundle exec rake db:migrate
```

### Запуск сервера

Запустите сервер:

```bash
bundle exec rails s
```

Проверьте работу приложения по адресу: [http://127.0.0.1:3000/](http://127.0.0.1:3000/)

