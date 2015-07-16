# This is something

To start something:

1. Install postgresql with user 'postgres' and login and creatdb permissions

    `# create role postgres login createdb;`

2. Install dependencies with `mix deps.get`.
3. Create the database.

    `$ mix ecto.create`

4. Run the migrations.

    `$ mix ecto.migrate Iris.Repo`

5. Install npm dependencies.

    `$ npm install`

6. Initialize the database

```shell
$ mix -S mix phoenix.server
Erlang/OTP 17 [erts-6.2] [source] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false] [dtrace]

[info] Running Iris.Endpoint with Cowboy on port 4000 (http)
Interactive Elixir (1.0.2) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 
iex(1)> import_file "priv/repo/seeds.exs"
...
iex(2)>
```

7. Then exit the mix session with `Ctrl-c`

8. Start Phoenix app with `mix phoenix.server`

Now you can visit `localhost:4000` from your browser.

