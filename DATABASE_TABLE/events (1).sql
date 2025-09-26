
/*
    DROP TABLE IF EXISTS events CASCADE;
*/

CREATE TABLE IF NOT EXISTS events
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    ------ Role -----

    type_code text NOT NULL DEFAULT '110',
    type_name text NOT NULL DEFAULT 'Movie',
    
    event_code text NOT NULL,
    event_name text NOT NULL,

    event_date date NOT NULL,
    event_start_time text NOT NULL DEFAULT '6:00 PM',
    event_end_time text NOT NULL DEFAULT '8:00 PM',

    ------ Venue details ------
    
    venue_id uuid, 
    venue_code text NOT NULL,
    venue_name text NOT NULL,
    venue_address text,

    ------ Operators ------

    event_manager text, -- username
    event_operator1 text, -- username
    event_operator2 text, -- username
    event_checker1 text, -- username
    event_checker2 text, -- username
        
    ------ Tickets ---------------

    total_tickets integer NOT NULL DEFAULT 0,
    total_ticket_price integer NOT NULL DEFAULT 0, -- AUD
    total_tickets_sold integer NOT NULL DEFAULT 0,
    total_ticket_sales_amount integer NOT NULL DEFAULT 0, -- AUD
    
    vip_tickets integer NOT NULL DEFAULT 0,
    plat_tickets integer NOT NULL DEFAULT 0,
    gold_tickets integer NOT NULL DEFAULT 0,
    silver_tickets integer NOT NULL DEFAULT 0,

    vip_ticket_price integer NOT NULL DEFAULT 0, -- AUD
    plat_ticket_price integer NOT NULL DEFAULT 0, -- AUD
    gold_ticket_price integer NOT NULL DEFAULT 0, -- AUD
    silver_ticket_price integer NOT NULL DEFAULT 0, -- AUD

    vip_tickets_sold integer NOT NULL DEFAULT 0,
    plat_tickets_sold integer NOT NULL DEFAULT 0,
    gold_tickets_sold integer NOT NULL DEFAULT 0,
    silver_tickets_sold integer NOT NULL DEFAULT 0,
    
    vip_tickets_used integer NOT NULL DEFAULT 0,
    plat_tickets_used integer NOT NULL DEFAULT 0,
    gold_tickets_used integer NOT NULL DEFAULT 0,
    silver_tickets_used integer NOT NULL DEFAULT 0,
        
    ------ Validation checks ------------------

    created_by text,
    created_at timestamp with time zone,
    edited_by text,
    edited_at timestamp with time zone,

    data_digest text,  

    CONSTRAINT pk_events PRIMARY KEY (id),
    CONSTRAINT uk_events_code UNIQUE (event_code) 
);

CREATE INDEX idx_events_name ON events (event_name);



