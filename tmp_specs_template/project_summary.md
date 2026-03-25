# Pidjet Project Requirements & Goals (PRD Summary)

## 1. Project Vision
**Pidjet** is a strict, type-safe Function-as-a-Service (FaaS) framework written in Dart. The main goal is to provide a **zero-boilerplate developer experience**. Users only need to write pure, predictable Dart functions that take a strictly typed `RequestData` object and return a `ResponseData` object. The framework takes care of routing, request body parsing, error handling, and response serialization through build-time code generation.

## 2. Technology Stack & Architecture
- **Language**: Dart (compiled to fully static AOT native executables).
- **Proxy/Load Balancer**: Caddy (modular, routing via Unix Domain Sockets).
- **Process Manager**: A pure Dart orchestrator acting as PID 1.
- **Code Generation**: 
  - **Mason**: Generates server wrappers, orchestrator, and proxy configurations.
  - **Freezed**: Generates type-safe user models.
- **Monorepo Management**: Melos, Dart Workspaces, and GitHub Actions.

## 3. Developer Experience (Convention over Configuration)
Pidjet relies heavily on strict naming conventions and directory structures to eliminate boilerplate.

### Configuration (`project.yaml`)
A strict manifest defining services, instances, base routes, and endpoints. Each endpoint specifies:
- `path`: The route (e.g., `/book/:id`).
- `method`: HTTP method (GET, POST, etc.).
- `workdir`: The isolated directory containing the endpoint's logic.
- `type`: The expected request body type (`none`, `json`, `string`, `urlencoded`, `bytes`, `multipart`).

### Directory Structure & Implementation
For a given `workdir` (e.g., `create_book/`), the user provides:
- `handler.dart` (Mandatory): Contains a `Future<ResponseData> handle(RequestData<T> request) async` function.
- `response.dart` (Optional): Contains Freezed data models extending `ResponseData`.

### Framework Responsibilities (No Raw HTTP Requests)
Users never interact with raw `HttpRequest` objects. The framework's generated wrapper:
1. Parses the incoming request based on the `type` specified in `project.yaml`.
2. Injects the parsed body, headers, path parameters, and query parameters into a strongly-typed `RequestData<T>` object.
3. Invokes the user's `handle` function.
4. Serializes the returned `ResponseData` back to the client.
5. Catches and handles all errors globally.

---
### Request Routing & Parsing Notes
1. **Proxy Routing**: The reverse proxy / load balancer (Caddy) strictly routes only the correct paths to the specific server instances. For example, a GET request to `/api/book/:id` will only be forwarded to the server wrapping that specific endpoint, not to `/api/book/create`.
2. **Mason Server Generation**: The user writes a pure Dart function (e.g., `handleRequest()`). `pidjet_cli` reads `project.yaml` and leverages Mason to generate an actual HTTP server instance (`server.dart`), injecting the user's function.
3. **Taskfile & Linking**: `pidjet_cli` generates a `Taskfile.yml` that builds EACH instance of EACH user-defined service, passing the correct Unix Domain Socket path via Dart compilation flags at build time. It then generates a continuous `Caddyfile` linking every single generated socket path.
4. **HTTP Body Parsers & Request Instantiation**: The generated server relies on the HTTP Body Parsers (located in `pidjet_internal`). These parsers read the incoming `HttpRequest` (via `dart:io`) and instantiate the exact subclass of `RequestData` (located in `pidjet_core`) that the user's `handle` function expects.

---

### Package Architecture
- **pidjet_core**: Public, pure Dart (no `dart:io`). Contains models and contracts.
- **pidjet_internal**: Internal use only. Depends on `dart:io`. Contains parsing and plumbing logic.
- **pidjet_cli**: Public CLI for code generation and project management.

