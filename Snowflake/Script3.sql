CREATE OR REPLACE FILE FORMAT CSV_FILEFORMAT TYPE = CSV; -- without header

CREATE OR REPLACE FILE FORMAT MY_CSV_FORMAT TYPE = CSV SKIP_HEADER = 1; -- with header
