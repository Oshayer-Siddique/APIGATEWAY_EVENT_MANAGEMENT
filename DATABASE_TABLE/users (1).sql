
-- Table: "users" to hold the system level configurable values / settings
/*
DROP TABLE IF EXISTS users CASCADE;

*/

CREATE TABLE IF NOT EXISTS users
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    ------ Role -----

    role_code text NOT NULL DEFAULT '801',
    role_name text NOT NULL DEFAULT 'User',
    userame text NOT NULL,

    ------ Personal details ------
    
    first_name text NOT NULL,
    middle_name text,
    last_name text,
    full_name text NOT NULL,
    address text,
    
    email text NOT NULL,
    is_email_verified boolean NOT NULL,
    email_verified_at timestamp with time zone,
    mobile text,
    is_mobile_verified boolean NOT NULL,
    mobile_verified_at timestamp with time zone,
        
    ------ Time data -------------------------

    signup_date date NOT NULL CURRENT_DATE,
    signup_at timestamp with time zone,
    last_login_at timestamp with time zone,
    last_logout_at timestamp with time zone,

    ------ Ticketing behaviour ---------------

    total_ticket_count integer NOT NULL DEFAULT 0, 
    total_ticket_price real NOT NULL DEFAULT 0, -- AUD
    tickets_used integer NOT NULL DEFAULT 0,
    tickets_at_hand integer NOT NULL DEFAULT 0,
    
    ------ Validation checks ------------------
    
    data_digest text, 
    user_consent text, 

    CONSTRAINT pk_users PRIMARY KEY (id),
    CONSTRAINT uk_users_code UNIQUE (userame) 
);

CREATE INDEX idx_users_name ON users (full_name);



