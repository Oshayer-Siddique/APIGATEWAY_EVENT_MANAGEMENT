
/*
    DROP TABLE IF EXISTS event_tickets CASCADE;
*/

CREATE TABLE IF NOT EXISTS event_tickets
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),
    ------ Role -----

    type_code text NOT NULL DEFAULT '110',
    type_name text NOT NULL DEFAULT 'Movie',
    
    event_id uuid, 
    event_code text NOT NULL,
    event_name text NOT NULL,

    event_date date NOT NULL,
    event_start_time text NOT NULL DEFAULT '6:00 PM',
    event_end_time text NOT NULL DEFAULT '8:00 PM',

    ------ Venue details ------
    
    venue_id uuid, 
    venue_code text NOT NULL,
    venue_name text NOT NULL,
    seat_id uuid, 
    seat_no text, 
    
    ------ Tickets ---------------

    class_code integer NOT NULL DEFAULT 3, -- LOV: 1, 2, 3, 4 
    class_name text NOT NULL DEFAULT 'Gold', -- VIP, Platinum, Gold, Silver
    ticket_no text NOT NULL,    
    ticket_price integer NOT NULL DEFAULT 0,

    ------ Ticket sale ---------------

    bought_by text, -- username
    bought_on date, 
    bought_at timestamp with time zone,

    used_at timestamp with time zone,
    checked_by text, -- username

    ------ Validation checks -------

    created_by text,
    created_at timestamp with time zone,
    edited_by text,
    edited_at timestamp with time zone,

    data_digest text,  

    CONSTRAINT pk_event_tickets PRIMARY KEY (id),
    CONSTRAINT uk_event_tickets_code UNIQUE (event_code) 
);

CREATE INDEX idx_event_tickets_name ON event_tickets (event_name);



