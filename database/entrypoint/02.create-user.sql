-- forum 사용자 생성 (이미 존재하지 않을 경우)
DO
$$
BEGIN
    IF NOT EXISTS (
        SELECT
        FROM pg_catalog.pg_roles
        WHERE rolname = 'forum'
    )
    THEN
        CREATE USER forum
        WITH
            ENCRYPTED PASSWORD 'forum';
    END IF;
END
$$;