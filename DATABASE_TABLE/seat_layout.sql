:Seat Layout Table:seat_layout.sql
/*
    DROP TABLE IF EXISTS seat_layout CASCADE;
*/

CREATE TABLE IF NOT EXISTS seat_layout
(
    id uuid NOT NULL DEFAULT uuid_generate_v4(),

    ------ Layout Type -----

    type_code text NOT NULL, -- e.g., '100' for Theatre, '200' for Banquet, '300' for Free Style
    type_name text NOT NULL, -- e.g., 'Theatre', 'Banquet', 'Free Style'
    
    venue_id uuid NOT NULL,
    layout_name text NOT NULL,

    ------ Layout specific details ------
    
    -- Used for Theatre seating
    total_rows integer,
    total_cols integer,

    -- Used for Banquet seating
    total_tables integer,
    chairs_per_table integer,

    -- Used for Free Style seating
    standing_capacity integer,

    -- General for all types
    total_capacity integer NOT NULL,
    is_active boolean NOT NULL DEFAULT true,

    ------ Validation checks ------------------

    created_by text,
    created_at timestamp with time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    edited_by text,
    edited_at timestamp with time zone,
    data_digest text,

    CONSTRAINT pk_seat_layout PRIMARY KEY (id),
    CONSTRAINT uk_seat_layout_name UNIQUE (layout_name),
    CONSTRAINT fk_seat_layout_venue FOREIGN KEY (venue_id) REFERENCES event_venues (id)
);