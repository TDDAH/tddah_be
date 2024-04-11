# Backend Contract

__Frontend URL__

https://tddah-be-39c5a52e8b65.herokuapp.com

## User Endpoints

### Create User

__Request__

`POST api/v1/users`

__JSON Payload__
```
{
    "name": "string",
    "email": "example@example.com",
    "password": "string123",
    "password_confirmation": "string123"
}
```

### Show User

__Request__

`GET /api/v1/user/:id`

__JSON Returns__
```
{
    "data": {
        "id": "1",
        "type": "user",
        "attributes": {
            "name": "string",
            "email": "example@example.com"
        }
    }
}
```

### Index Users

__Request__

`GET /api/v1/users`

__JSON Return__
```
{
    "data": [
        {
            "id": "1",
            "type": "user",
            "attributes": {
                "name": "Joe",
                "email": "test@test.com"
            }
        },
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "name": "Jane",
                "email": "jane@test.com"
            }
        }
    ]
}
```

## Repo

### Create Repo

`POST /api/v1/users/:user_id/repos`

__JSON__
```
{
    "owner": "string",
    "name": "string"
}
```

### Show Repo

`GET /api/v1/users/:user_id/repos/:id`

__JSON Return__
```
{
    "data": {
        "id": "3",
        "type": "repo",
        "attributes": {
            "id": 3,
            "user": "Joe",
            "owner": "s2an",
            "name": "lunch_and_learn_be_7",
            "covered_percent": "86.05%"
        }
    }
}
```

### Index Repos

`GET /api/v1/users/:user_id/repos/`

_Not yet working on Postman_

## Achievements

`GET /api/v1/achievements`

_Not yet working on Postman_

### Create Achievement

__BACKEND ONLY__

`POST /api/v1/achievements`

__JSON Payload__
```
{
    "name": "string",
    "criteria": "string"
}
```

