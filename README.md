# Iris

To start Iris:

1. Install postgresql with user 'postgres' and login and creatdb permissions

    `# create role postgres login createdb;`

2. Install dependencies with `mix deps.get`.
3. Create the database.

    `$ mix ecto.create`

4. Run the migrations.

    `$ mix ecto.migrate Iris.Repo`

5. Install npm dependencies.

    `$ npm install`

5. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

