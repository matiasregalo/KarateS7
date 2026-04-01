# SofkaS7 — Karate API Test Suite

Proyecto de automatización de pruebas de API REST usando el framework **Karate** sobre la API pública de [Automation Exercise](https://automationexercise.com).

---

## Requisitos previos

| Herramienta | Versión mínima |
|-------------|----------------|
| Java (JDK)  | 11             |
| Maven       | 3.6+           |

Verificar instalación:

```bash
java -version
mvn -version
```

---

## Estructura del proyecto

```
src/test/java/
├── karate-config.js              # Configuración global (mínima, sin setup costoso)
├── logback-test.xml              # Configuración de logging
├── Test.java             # Runner principal (JUnit 5, paralelo x5)
├── common/
│   └── common-utils.feature      # Utilidades reutilizables: uuid, timestamp, etc.
├── data/
│   └── users/
│       ├── create-user.json      # Datos base para creación de usuario
│       └── update-user.json      # Datos base para actualización de usuario
└── features/
    └── users/
        ├── create-user.feature    # POST   /api/createAccount
        ├── CreateUserRunner.java
        ├── get-user.feature       # GET    /api/getUserDetailByEmail
        ├── GetUserRunner.java
        ├── update-user.feature    # PUT    /api/updateAccount
        ├── UpdateUserRunner.java
        ├── delete-user.feature    # DELETE /api/deleteAccount
        └── DeleteUserRunner.java
```

---

## Ejecución

### Ejecutar toda la suite

```bash
mvn clean test
```

### Ejecutar un escenario específico por su runner

```bash
# Solo crear usuario
mvn clean test -Dtest=CreateUserRunner

# Solo obtener usuario
mvn clean test -Dtest=GetUserRunner

# Solo actualizar usuario
mvn clean test -Dtest=UpdateUserRunner

# Solo eliminar usuario
mvn clean test -Dtest=DeleteUserRunner
```

### Ejecutar con un entorno específico

```bash
mvn clean test -Dkarate.env=e2e
```

> El entorno por defecto es `dev`. Los entornos se configuran en `karate-config.js`.

---

## Reportes

Después de ejecutar los tests, los reportes HTML se generan automáticamente en:

```
target/karate-reports/
├── karate-summary.html              # Resumen general de la ejecución
├── karate-timeline.html             # Línea de tiempo de los escenarios
├── features.users.create-user.html
├── features.users.get-user.html
├── features.users.update-user.html
└── features.users.delete-user.html
```

Abrir el reporte principal:

```bash
# Windows
start target\karate-reports\karate-summary.html
```

---

## Escenarios cubiertos

| Feature         | Método HTTP | Endpoint                        | Validación principal          |
|-----------------|-------------|---------------------------------|-------------------------------|
| create-user      | POST        | `/api/createAccount`            | `responseCode == 201`         |
| get-user         | GET         | `/api/getUserDetailByEmail`     | `responseCode == 200`         |
| update-user      | PUT         | `/api/updateAccount`            | `message == 'User updated!'`  |
| delete-user      | DELETE      | `/api/deleteAccount`            | `message == 'Account deleted!'` |

> Los features `get-user`, `update-user` y `delete-user` reutilizan `create-user.feature@create_user` para generar un usuario fresco antes de cada prueba