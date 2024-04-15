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
                "name": "string",
                "email": "example@example.com"
            }
        },
        {
            "id": "2",
            "type": "user",
            "attributes": {
                "name": "string",
                "email": "example2@example.com"
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
            "user": "string",
            "owner": "github owner's name",
            "name": "repo's name",
            "covered_percent": "calculated upon creating repo"
        }
    }
}
```

### Index Repos

`GET /api/v1/users/:user_id/repos/`

__JSON Return__
```
[
    {
        "id": 1,
        "error": "Coverage file not found."
    },
    {
        "id": 2,
        "error": "Coverage file not found."
    },
    {
        "data": {
            "id": "3",
            "type": "repo",
            "attributes": {
                "id": 3,
                "user": "string",
                "owner": "repo owner",
                "name": "repo name",
                "covered_percent": "86.05%"
            }
        }
    }
]
```

## Achievements

### Create Achievement

_Creating acheivements is not currently supported by the frontend_

`POST /api/v1/achievements`

__JSON Payload__
```
{
    "name": "string",
    "criteria": "string"
}
```

### Index Achievements

`GET /api/v1/achievements`

__JSON Return__

```
{
    "data": [
        {
            "id": "1",
            "type": "achievement",
            "attributes": {
                "name": "SimpleCov Pro",
                "criteria": "SimpleCov coverage achieves over 95%"
            }
        },
        {
            "id": "2",
            "type": "achievement",
            "attributes": {
                "name": "SimpleCov Wizard",
                "criteria": "SimpleCov coverage achieves 100%"
            }
        }
    ]
}