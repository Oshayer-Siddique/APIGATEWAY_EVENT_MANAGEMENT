CREATE TABLE IF NOT EXISTS artists
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    ------ Role -----

    type_code text NOT NULL, -- e.g., '100', '110', etc. for artist type
    type_name text NOT NULL, -- e.g., 'Performer', 'Band', 'DJ'

    artist_name text NOT NULL,
    genre text,
    biography text,

    ------ Contact details ------

    contact_email text,
    contact_phone text,

    ------ Website & Social Media ------
    website_url text,
    social_media_links text,

    ------ Validation checks ------------------
    created_by text,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_by text,
    edited_at timestamp with time zone,
    data_digest text,

    CONSTRAINT pk_artists PRIMARY KEY (id),
    CONSTRAINT uk_artists_name UNIQUE (artist_name)
);