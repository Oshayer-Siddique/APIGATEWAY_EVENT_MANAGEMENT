
/* 
   DROP TABLE IF EXISTS event_venues CASCADE;
*/

CREATE TABLE IF NOT EXISTS event_venues
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    ------ Role -----

    type_code text NOT NULL '100',
    type_name text NOT NULL DEFAULT 'Theatre',
    -- 100 = Theatre, 110 = Ballroom, 120 = Concert, 130 = Stadium
    
    venue_code text NOT NULL,
    venue_name text NOT NULL,
    
    ------ Personal details ------
    
    address text NOT NULL,    
    email text,
    phone text,
        
    ------ Ticketing stat ---------------

    total_events integer NOT NULL DEFAULT 0, 
    live_events integer NOT NULL DEFAULT 0, 
    events_upcoming integer NOT NULL DEFAULT 0, 
    
    ------ Validation checks ------------------

    created_by text,
    created_at timestamp with time zone,
    edited_by text,
    edited_at timestamp with time zone,

    data_digest text,

    CONSTRAINT pk_event_venues PRIMARY KEY (id),
    CONSTRAINT uk_event_venues_code UNIQUE (venue_code),
    CONSTRAINT uk_event_venues_name UNIQUE (venue_name) 
);

CREATE INDEX idx_event_venues_name ON event_venues (venue_name);



