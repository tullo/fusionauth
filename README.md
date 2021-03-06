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
1. Open [127.0.0.1.nip.io:3000/](https://127.0.0.1.nip.io:3000/)

---

## Production / Kubernetes Cluster

Deploy service dependencies.

### Database


Deploy `bitnami/postgresql` helm chart with [cloud.okteto.com](https://cloud.okteto.com) catalog deployment using [db-values.yaml](db-values.yaml) template values.

### Elasticsearch

Deploy `elastic/elasticsearch` helm chart using [es-values.yaml](es-values.yaml) template values.

```sh
helm install elasticsearch elastic/elasticsearch \
  --version 7.16.3 \
  --values es-values.yaml

kubectl get pods --namespace=... -l app=elasticsearch-master -w
# NAME                     READY   STATUS    RESTARTS   AGE
# elasticsearch-master-0   1/1     Running   0          20m
```

### FusionAuth

1. Deploy `fusionauth/fusionauth` helm chart using [fa-values.yaml](fa-values.yaml) template values.

    ```sh
    helm install fusionauth-1.32.1 fusionauth/fusionauth \
    --version '0.10.5' \
    --values fa-values.yaml

    kubectl get pods -l app.kubernetes.io/name=fusionauth -w
    # NAME                          READY   STATUS    RESTARTS   AGE
    # fusionauth-6b7775c49b-rj98p   1/1     Running   0          13m
    ```
1. Setup admin user.
1. Create a fusionauth application.
1. Edit the user and add a `registration` for the app just created.
2. Update `.env` with values from the fusionauth application.

### Authenticate

1. `npm start`
1. Open [127.0.0.1.nip.io:3000/](https://127.0.0.1.nip.io:3000/)

---

## Helm Charts

- [Elasticsearch Helm Chart](https://github.com/elastic/helm-charts/tree/v7.16.3/elasticsearch) v7.16.3
- [FusionAuth Helm Chart](https://github.com/FusionAuth/charts/tree/0.10.5) v0.10.5


```sh
helm list
# NAME             	STATUS  	CHART               	APP VERSION
# elasticsearch    	deployed	elasticsearch-7.16.3	7.16.3     
# fusionauth-1.32.1	deployed	fusionauth-0.10.5   	1.30.1     
# postgresql       	deployed	postgresql-6.3.12   	11.5.0     
```

---

## TODO

- [Set up minimal security for Elasticsearch](https://www.elastic.co/guide/en/elasticsearch/reference/7.16/security-minimal-setup.html)
