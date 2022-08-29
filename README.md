# Proyecto Ejemplo

Repositorio que se usará para subir el código utilizado en las ayudantías del curso

## Setup

Clonar este repositorio e instalar las dependencias:

```bash
bundle install
```

Crear un archivo **.env** y llenar las variables correspondientes:

```bash
cp .env.example .env
```

Luego, crear la base de datos que se utilizará para el desarrollo del proyecto (y correr migraciones si es necesario):

```bash
rails db:create
rails db:migrate
```

Por último, levanta el servidor:
```bash
rails s
```
