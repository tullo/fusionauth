# fusionauth

User authn & authz using [FusionAuth](https://fusionauth.io/) for secure access management.

## Development

For a quick local setup.

### docker-compose

1. `cd docker && docker-compose pull`
1. `docker-compose up -d`
1. Open [localhost:9011/](http://localhost:9011/)
1. Setup admin user.
1. Create a fusionauth application.
1. Edit the user and add a `registration` for the app just created.

### OAuth configuration

1. Open http://localhost:9011/admin/application/
1. View the details of the created fusionauth application.
1. Take note of `Client Id:` and `Client secret:`
1. `cp .env.template .env`
1. Replace the values in `.env` with the values from the application.

### Authenticate

1. `npm i && npm start`
1. Open [localhost:3000/](http://localhost:3000/)

---

## Production

1. Deploy FusionAuth `kubectl apply -f k8s.yaml` in Kubernetes cluster.
1. Setup admin user.
1. Create a fusionauth application.
1. Edit the user and add a `registration` for the app just created.
2. Update `.env` with values from the fusionauth application.
