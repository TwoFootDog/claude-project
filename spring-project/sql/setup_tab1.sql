-- Connect to demo_db database first
-- \c demo_db

-- Create tab1 table
CREATE TABLE IF NOT EXISTS tab1 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index for faster searches
CREATE INDEX IF NOT EXISTS idx_tab1_name ON tab1(name);

-- Insert sample data
INSERT INTO tab1 (name, description, status) VALUES
('Item 1', 'First test record', 'active'),
('Item 2', 'Second test record', 'active'),
('Item 3', 'Third test record', 'inactive'),
('Item 4', 'Fourth test record', 'active'),
('Item 5', 'Fifth test record', 'inactive');

-- Verify table was created
SELECT * FROM tab1;