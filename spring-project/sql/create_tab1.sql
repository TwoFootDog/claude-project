-- Create tab1 table
CREATE TABLE IF NOT EXISTS tab1 (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(50) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add index on name for faster searches
CREATE INDEX IF NOT EXISTS idx_tab1_name ON tab1(name);

-- Insert sample data
INSERT INTO tab1 (name, description, status) VALUES
('Record 1', 'First test record', 'active'),
('Record 2', 'Second test record', 'active'),
('Record 3', 'Third test record', 'inactive');

-- Verify table creation
SELECT * FROM tab1;