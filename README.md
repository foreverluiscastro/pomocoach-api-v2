# PomoCoach API

![Alt text](./public/PC-logo.PNG)


This is the server for the **PomoCoach** app. To get this app to run locally you need to clone this repo as well as the [frontend repo](https://github.com/foreverluiscastro/pomo-coach-frontend-v2).

The development server uses Postgresql 14 as the database. Make sure you have postgres installed before setting up the server.

To setup the server locally run:

```bash
$ rails db:create mirgate seed
```

Due to the frotend sending requests to localhost 3001, you have to run the server on port 3001 using:

```bash
$ rails s -p 3001
```
