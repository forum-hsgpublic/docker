-- Forum 데이터베이스 연결
\c forum forum

-- Users 테이블 (포럼 사용자)
CREATE TABLE IF NOT EXISTS users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    login_id VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    is_active BOOLEAN DEFAULT TRUE,
    join_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_login TIMESTAMP DEFAULT NULL
);

-- Categories 테이블 (게시물 카테고리)
CREATE TABLE IF NOT EXISTS categories (
    category_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Posts 테이블 (게시물)
CREATE TABLE IF NOT EXISTS posts (
    post_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated_date TIMESTAMP,
    user_id UUID REFERENCES Users(user_id) ON DELETE SET NULL,
    category_id UUID REFERENCES Categories(category_id) ON DELETE SET NULL
);

-- Comments 테이블 (댓글)
CREATE TABLE IF NOT EXISTS comments (
    comment_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    content TEXT NOT NULL,
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_id UUID REFERENCES Posts(post_id) ON DELETE CASCADE,
    user_id UUID REFERENCES Users(user_id) ON DELETE SET NULL
);

-- Tags 테이블 (태그)
CREATE TABLE IF NOT EXISTS tags (
    tag_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(50) UNIQUE NOT NULL
);

-- Post_Tags 테이블 (게시물-태그 관계) with 복합 기본 키
CREATE TABLE IF NOT EXISTS post_tags (
    post_id UUID REFERENCES Posts(post_id) ON DELETE CASCADE,
    tag_id UUID REFERENCES Tags(tag_id) ON DELETE CASCADE,
    PRIMARY KEY (post_id, tag_id)
);