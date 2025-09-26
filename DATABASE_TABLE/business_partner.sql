:Business Partners Table:business_partners.sql
/*
    DROP TABLE IF EXISTS business_partners CASCADE;
*/

CREATE TABLE IF NOT EXISTS business_partners
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),

    ------ Role -----

    type_code text NOT NULL, -- e.g., '200', '210'
    type_name text NOT NULL, -- e.g., 'Organizer', 'Sponsor'
    
    business_name text NOT NULL,
    business_registration_number text,
    is_active boolean NOT NULL DEFAULT true,

    ------ Contact details ------

    address text,
    email text,
    phone text,
    website_url text,

    ------ Event stats (for organizers) ------

    total_events integer NOT NULL DEFAULT 0,
    live_events integer NOT NULL DEFAULT 0,
    events_upcoming integer NOT NULL DEFAULT 0,

    ------ Sponsorship stats (for sponsors) ------
    
    total_sponsored_events integer NOT NULL DEFAULT 0,
    total_sponsorship_amount integer NOT NULL DEFAULT 0,

    ------ Validation checks ------------------

    created_by text,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_by text,
    edited_at timestamp with time zone,
    data_digest text,

    CONSTRAINT pk_business_partners PRIMARY KEY (id),
    CONSTRAINT uk_business_partners_name UNIQUE (business_name)
);

CREATE INDEX idx_business_partners_name ON business_partners (business_name);