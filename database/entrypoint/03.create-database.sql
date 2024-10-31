SELECT '
    CREATE DATABASE forum
    WITH
        OWNER = forum
        ENCODING = "UTF8"
        LC_COLLATE = "ko_KR.UTF-8"
        LC_CTYPE = "ko_KR.UTF-8"
'
WHERE NOT EXISTS (
    SELECT
        FROM pg_database
        WHERE datname = 'forum'
)\gexec