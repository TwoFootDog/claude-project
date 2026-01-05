# Spring Boot 3 Demo Project

Spring Boot 3 application with PostgreSQL and MyBatis integration.

## Tech Stack

- **Java**: 25
- **Spring Boot**: 3.2.0
- **Database**: PostgreSQL
- **ORM**: MyBatis
- **Build Tool**: Gradle 8.5

## Prerequisites

- JDK 25
- Gradle 8.5+ (or use included Gradle wrapper)
- PostgreSQL 15+

## Setup

### 1. Database Setup

See [DATABASE_SETUP.md](DATABASE_SETUP.md) for detailed PostgreSQL setup instructions.

Quick setup:
```sql
CREATE DATABASE demo_db;
\c demo_db
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO users (name, email) VALUES
('Alice Smith', 'alice@example.com'),
('Bob Johnson', 'bob@example.com'),
('Charlie Brown', 'charlie@example.com');
```

### 2. Build Project

**Using Gradle wrapper (recommended - no installation needed):**
```bash
./gradlew clean build
```

**Or using installed Gradle:**
```bash
gradle clean build
```

### 3. Run Application

**Using Gradle wrapper:**
```bash
./gradlew bootRun
```

**Or using installed Gradle:**
```bash
gradle bootRun
```

The application will start on `http://localhost:8080`

## API Endpoints

### GET /api/hello
Test endpoint that returns a greeting message.

**Response:**
```json
{
  "message": "Hello from Spring Boot!",
  "timestamp": "2025-12-30T10:30:00"
}
```

### GET /api/users
Get all users from the database.

**Response:**
```json
[
  {
    "id": 1,
    "name": "Alice Smith",
    "email": "alice@example.com",
    "createdAt": "2025-12-30T10:00:00"
  },
  {
    "id": 2,
    "name": "Bob Johnson",
    "email": "bob@example.com",
    "createdAt": "2025-12-30T10:00:00"
  }
]
```

### POST /api/users
Create a new user.

**Request:**
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Response:**
```json
{
  "id": 4,
  "name": "John Doe",
  "email": "john@example.com",
  "createdAt": "2025-12-30T10:35:00"
}
```

## Testing

Test endpoints using curl:

```bash
# Test hello endpoint
curl http://localhost:8080/api/hello

# Get all users
curl http://localhost:8080/api/users

# Create new user
curl -X POST http://localhost:8080/api/hello \
  -H "Content-Type: application/json" \
  -d '{"name":"John Doe","email":"john@example.com"}'
```

## CORS Configuration

The application is configured to accept requests from:
- `http://localhost:5173` (Vue development server)

See `CorsConfig.java` to modify allowed origins.

## Project Structure

```
src/
├── main/
│   ├── java/com/example/demo/
│   │   ├── DemoApplication.java          # Main application class
│   │   ├── config/
│   │   │   └── CorsConfig.java           # CORS configuration
│   │   ├── controller/
│   │   │   └── ApiController.java        # REST API endpoints
│   │   ├── service/
│   │   │   └── UserService.java          # Business logic
│   │   ├── mapper/
│   │   │   └── UserMapper.java           # MyBatis mapper interface
│   │   └── model/
│   │       └── User.java                 # User entity
│   └── resources/
│       ├── application.yml               # Application configuration
│       └── mapper/
│           └── UserMapper.xml            # MyBatis SQL mappings
└── test/
    └── java/com/example/demo/
        └── DemoApplicationTests.java     # Test class
```

## Configuration

Edit `src/main/resources/application.yml` to customize:

- Server port (default: 8080)
- Database connection details
- MyBatis configuration

## Troubleshooting

### Application fails to start

**Check Java version:**
```bash
java -version
```
Should show Java 25.

**Check PostgreSQL is running:**
```bash
psql -U postgres -c "SELECT version();"
```

### Database connection errors

- Verify PostgreSQL service is running
- Check credentials in `application.yml`
- Ensure database `demo_db` exists

### Port 8080 already in use

Change the port in `application.yml`:
```yaml
server:
  port: 8081
```

## Integration with Vue Frontend

This Spring Boot backend is designed to work with the Vue 3 frontend located in `../vue-project`.

1. Start Spring Boot: `./gradlew bootRun`
2. Start Vue: `cd ../vue-project && npm run dev`
3. Open browser: `http://localhost:5173/about`
4. Click buttons to test API integration

See the Vue project README for more details.