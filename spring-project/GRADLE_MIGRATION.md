# Maven to Gradle Migration

This project has been migrated from Maven (pom.xml) to Gradle (build.gradle.kts).

## New Gradle Files

- **build.gradle.kts** - Main Gradle build configuration (Kotlin DSL)
- **settings.gradle.kts** - Gradle settings file
- **gradle.properties** - Gradle properties for optimization
- **gradle/wrapper/gradle-wrapper.properties** - Gradle wrapper configuration
- **gradlew** - Gradle wrapper script (Unix/Linux/Mac)
- **gradlew.bat** - Gradle wrapper script (Windows)

## Gradle Wrapper

The project includes the Gradle wrapper, so you don't need to install Gradle separately.

**Windows:**
```bash
./gradlew bootRun
```

**Unix/Linux/Mac:**
```bash
./gradlew bootRun
```

## Common Gradle Commands

### Building

```bash
# Clean and build
./gradlew clean build

# Build without tests
./gradlew clean build -x test

# Build jar file
./gradlew jar
```

### Running

```bash
# Run the Spring Boot application
./gradlew bootRun

# Run with custom port
./gradlew bootRun --args='--server.port=9090'
```

### Testing

```bash
# Run all tests
./gradlew test

# Run specific test class
./gradlew test --tests com.example.demo.DemoApplicationTests
```

### Other Commands

```bash
# List all tasks
./gradlew tasks

# Check dependencies
./gradlew dependencies

# Clean build directory
./gradlew clean

# Run build with verbose output
./gradlew build --info
```

## Gradle vs Maven Equivalents

| Maven | Gradle |
|-------|--------|
| `mvn clean install` | `./gradlew clean build` |
| `mvn spring-boot:run` | `./gradlew bootRun` |
| `mvn test` | `./gradlew test` |
| `mvn package` | `./gradlew build` |
| `mvn dependency:tree` | `./gradlew dependencies` |

## IDE Integration

### IntelliJ IDEA

1. Open project
2. Right-click project root → "Import Gradle Project"
3. IDEA automatically syncs with Gradle

### VS Code

Install the Gradle Extension Pack:
- Gradle for Java
- Extension Pack for Java

## Gradle Daemon

The Gradle daemon is enabled by default in `gradle.properties` for faster builds. To disable:

```properties
org.gradle.daemon=false
```

## Build Performance

Gradle is typically faster than Maven due to:
- Parallel compilation
- Incremental builds
- Caching
- Gradle daemon

To enable additional optimizations in `gradle.properties`:

```properties
org.gradle.parallel=true
org.gradle.caching=true
org.gradle.daemon=true
```

## Troubleshooting

### "permission denied" on gradlew

On Unix-like systems:
```bash
chmod +x gradlew
```

### Clear Gradle cache

```bash
./gradlew clean --refresh-dependencies
```

### Update Gradle version

Edit `gradle/wrapper/gradle-wrapper.properties`:
```properties
distributionUrl=https\://services.gradle.org/distributions/gradle-8.6-bin.zip
```

Then run:
```bash
./gradlew wrapper --gradle-version 8.6
```

## Build Configuration Details

The `build.gradle.kts` uses Kotlin DSL and includes:

- **Plugins:**
  - `java` - Java compilation support
  - `org.springframework.boot` - Spring Boot plugin
  - `io.spring.dependency-management` - Dependency management

- **Properties:**
  - Java version: 25
  - Group: com.example
  - Version: 0.0.1-SNAPSHOT

- **Dependencies:**
  - spring-boot-starter-web
  - mybatis-spring-boot-starter:3.0.3
  - postgresql:42.7.0
  - lombok
  - spring-boot-starter-test

## Notes

- The old `pom.xml` is still present but no longer used (can be deleted)
- All Maven dependencies have been migrated to Gradle
- Java version remains 25 as specified
- Build outputs are in `build/` directory instead of `target/`

## More Information

- [Gradle Documentation](https://docs.gradle.org)
- [Spring Boot Gradle Plugin](https://docs.spring.io/spring-boot/docs/current/gradle-plugin/reference/html/)
- [Gradle Kotlin DSL](https://docs.gradle.org/current/userguide/kotlin_dsl.html)