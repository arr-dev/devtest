# Setup

```sh
bundle install

bin/setup
```

# API

## Endpoints

```
GET  /api/public/locations/:country_code
GET  /api/public/target_groups/:country_code

GET  /api/private/locations/:country_code
GET  /api/private/target_groups/:country_code
POST /api/private/evaluate_target
```

## Authentication

Create new api key with `bin/rake api_key:create`.

Use this token to access private API endpoints.

```
curl -X GET localhost:3000/api/private/locations/uk -X  -H "Authorization: Token TOKEN"
```
