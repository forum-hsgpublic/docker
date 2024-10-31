# Database.
## PostgreSQL.
- URL: https://www.postgresql.org
- Documentation: https://www.postgresql.org/docs

## 디렉토리 생성.
```bash
$ su - dockerer
$ mkdir -p ~/services/forum/postres/data ~/services/forum/postres/entrypoint
$ cd ~/services/forum/postres
```

## Entrypoint SQL 작성.
```console
$ vi ./entrypoint/01.settings.sql
    ...
$ vi ./entrypoint/02.create-user.sql
    ...
$ vi ./entrypoint/03.create-database.sql
    ...
$ vi ./entrypoint/04.create-tables.sql
    ...
```

## Environment 파일 작성.
```console
$ cp path/to/sample.evn .env
$ vi .env
    ...
```

## Docker compose 파일 작성 및 실행.
```console
$ vi compose.yaml
    ...
$ docker-compose -f compose.yaml up -d
```
