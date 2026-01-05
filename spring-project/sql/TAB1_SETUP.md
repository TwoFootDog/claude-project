# TAB1 Table Setup

## Quick Setup

### Method 1: Using psql (Recommended)

```bash
# Connect to PostgreSQL
psql -U postgres

# In psql console, run:
\c demo_db

# Then execute the SQL script:
\i 'sql/setup_tab1.sql'

# Or paste the SQL commands directly
```

### Method 2: Direct SQL Commands

Connect to PostgreSQL and run these commands:

```sql
-- Connect to demo_db database
\c demo_db

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
```

### Method 3: Using pgAdmin

1. Open pgAdmin
2. Connect to your PostgreSQL server
3. Navigate to demo_db database
4. Right-click on Tables → Create → Table
5. Fill in the following details:

**Table Name:** tab1

**Columns:**
- `id` - INTEGER, PRIMARY KEY, Auto-increment
- `name` - VARCHAR(100), NOT NULL
- `description` - TEXT
- `status` - VARCHAR(50), DEFAULT 'active'
- `created_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- `updated_at` - TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

6. Create index on `name` column for faster searches

## Table Schema

```
┌─────────────┬──────────────┬──────────────────┐
│ Column      │ Type         │ Constraints      │
├─────────────┼──────────────┼──────────────────┤
│ id          │ SERIAL       │ PRIMARY KEY      │
│ name        │ VARCHAR(100) │ NOT NULL         │
│ description │ TEXT         │ NULL             │
│ status      │ VARCHAR(50)  │ DEFAULT 'active' │
│ created_at  │ TIMESTAMP    │ DEFAULT NOW()    │
│ updated_at  │ TIMESTAMP    │ DEFAULT NOW()    │
└─────────────┴──────────────┴──────────────────┘
```

## Verify Table Creation

After creating the table, verify it was created successfully:

```sql
-- Show table structure
\d tab1

-- Count records
SELECT COUNT(*) FROM tab1;

-- View all records
SELECT * FROM tab1;

-- View specific columns
SELECT id, name, status FROM tab1;

-- Filter by status
SELECT * FROM tab1 WHERE status = 'active';
```

## Sample Data

The script automatically inserts 5 sample records:

| ID | Name   | Description           | Status   |
|----|--------|------------------------|----------|
| 1  | Item 1 | First test record      | active   |
| 2  | Item 2 | Second test record     | active   |
| 3  | Item 3 | Third test record      | inactive |
| 4  | Item 4 | Fourth test record     | active   |
| 5  | Item 5 | Fifth test record      | inactive |

## Drop Table (If Needed)

To remove the table:

```sql
DROP TABLE IF EXISTS tab1;
```

## Next Steps

After creating the tab1 table, you can:

1. Update the Spring Boot application to use this table
2. Create MyBatis mapper for tab1 CRUD operations
3. Add REST API endpoints for tab1 data
4. Create Vue components to display tab1 data

See the main README.md for integration instructions.