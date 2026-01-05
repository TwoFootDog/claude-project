# PostgreSQL Database Setup

## Prerequisites
- PostgreSQL 15 or higher installed
- PostgreSQL service running

## Step 1: Start PostgreSQL Service

### Windows
```bash
# As Administrator
net start postgresql-x64-15
```

Or use pgAdmin to start the service.

## Step 2: Connect to PostgreSQL

```bash
psql -U postgres
```

Enter your postgres user password when prompted.

## Step 3: Create Database and Tables

Run the following SQL commands:

```sql
-- Create database
CREATE DATABASE demo_db;

-- Connect to the new database
\c demo_db

-- Create users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert sample data
INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');

-- Verify data was inserted
SELECT * FROM users;

-- Exit psql
\q
```

## Step 4: Update Configuration (Optional)

If your PostgreSQL uses different credentials, update `src/main/resources/application.yml`:

```yaml
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/demo_db
    username: YOUR_USERNAME
    password: YOUR_PASSWORD
```

## Verification

To verify the database is set up correctly:

```bash
psql -U postgres -d demo_db -c "SELECT * FROM users;"
```

You should see the 3 sample users.

## Troubleshooting

### Connection refused
- Verify PostgreSQL service is running
- Check that PostgreSQL is listening on port 5432
- Update `pg_hba.conf` if necessary to allow local connections

### Authentication failed
- Verify username and password in `application.yml`
- Check PostgreSQL user permissions

### Database doesn't exist
- Make sure you ran `CREATE DATABASE demo_db;`
- Check database name spelling in `application.yml`