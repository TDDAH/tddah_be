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

__SAD PATHS__

- Missing Param: Name
```
{
    "name": [
        "can't be blank"
    ]
}
```
- Missing Param: Email
```
{
    "email": [
        "can't be blank"
    ]
}
```
- Duplicate: Email
```
{
    "email": [
        "has already been taken"
    ]
}
```
- Confirmation: Passwords Don't Match
```
{
    "password_confirmation": [
        "doesn't match Password"
    ]
}
```

### Destroy User

__Request__

`DELETE api/v1/users/:id`

__SAD PATH__
```
{
    "errors": [
        {
            "status": 404,
            "title": "Couldn't find User with 'id'=7"
        }
    ]
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

__SAD PATH__
```
{
    "errors": [
        {
            "status": 404,
            "title": "Couldn't find User with 'id'=:id"
        }
    ]
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

__SAD PATH__

- N/A

## Repo

### Create Repo

`POST /api/v1/users/:user_id/repos`

__JSON Payload__
```
{
    "owner": "string",
    "name": "string"
}
```

__SAD PATHS__

- Missing Param: Owner
```
{
    "owner": [
        "can't be blank"
    ]
}
```
- Missing Param: Name
```
{
    "name": [
        "can't be blank"
    ]
}
```

### Destroy Repo

__Request__

`DELETE api/v1/users/:user_id/repos/:id`

__SAD PATH__
```
{
    "errors": [
        {
            "status": 404,
            "title": "Couldn't find Repo with 'id'=15 [WHERE \"repos\".\"user_id\" = $1]"
        }
    ]
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

__SAD PATH__
```
{
    "error": "Coverage file not found."
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

__SAD PATH__

- N/A

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
                "name": "SimpleCov Novice",
                "criteria": "SimpleCov coverage achieves over 80%"
            }
        },
        {
            "id": "2",
            "type": "achievement",
            "attributes": {
                "name": "SimpleCov Pro",
                "criteria": "SimpleCov coverage achieves over 90%"
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