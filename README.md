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
├── karate-config.js          # Configuración global de Karate
├── examples/
│   ├── ExamplesTest.java     # Runner principal (JUnit 5, paralelo)
│   └── users/
│       ├── createUser.feature   # POST  /api/createAccount
│       ├── getUser.feature      # GET   /api/getUserDetailByEmail
│       ├── updateUser.feature   # PUT   /api/updateAccount
│       └── deleteUser.feature   # DELETE /api/deleteAccount
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
├── karate-summary.html          # Resumen general de la ejecución
├── karate-timeline.html         # Línea de tiempo de los escenarios
├── examples.users.createUser.html
├── examples.users.getUser.html
├── examples.users.updateUser.html
└── examples.users.deleteUser.html
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
| createUser      | POST        | `/api/createAccount`            | `responseCode == 201`         |
| getUser         | GET         | `/api/getUserDetailByEmail`     | `responseCode == 200`         |
| updateUser      | PUT         | `/api/updateAccount`            | `message == 'User updated!'`  |
| deleteUser      | DELETE      | `/api/deleteAccount`            | `message == 'Account deleted!'` |

> Los features `getUser`, `updateUser` y `deleteUser` reutilizan `createUser.feature@create_user` para generar un usuario fresco antes de cada prueba