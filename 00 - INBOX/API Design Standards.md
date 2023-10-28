# API Standards

## Contents

- [Overview](#overview)
- [Media Types](#media-types)
	- [Use JSON](#use-json)
	- [Use UTF-8](#use-utf-8)
	- [Use Consistent Date Format](#use-consistent-date-format)
- [API Keys](#api-keys)
- [Error Handling](#error-handling)
- [Pagination](#pagination)
- [HTTPS Always](#https-always)
- [CORS](#cors)
- [Useful Endpoint Controllers](#useful-endpoint-controllers)
	- [Status Endpoints](#status-endpoints)
		- [Basic Ping Endpoint](#basic-ping-endpoint)
		- [Database Connectivity Endpoint](#database-connectivity-endpoint)
		- [Dependency Checks](#dependency-checks)
		- [Resource Utilization Metrics](#resource-utilization-metrics)
		- [Cache Status Check](#cache-status-check)
		- [Queue Length and Processing Status](#queue-length-and-processing-status)
		- [Authentication and Authorization](#authentication-and-authorization)
		- [Service Dependency Healthchecks](#service-dependency-healthchecks)
		- [Custom Business Logic Checks](#custom-business-logic-checks)
		- [External Integration Checks](#external-integration-checks)
	- [Error Endpoints](#error-endpoints)
	- [Performance Endpoints](#performance-endpoints)
	- [Session Information Endpoints](#session-information-endpoints)


## Overview

- Design for common use cases
- Syndicate Data:
	- **Bulk Data**: Clients often wish to establish their own copy of the API's dataset in its entirety. For example, someone might like to build their own search engine on top of the dataset, using different parameters and technology than the "official" API allows. If the API can't easily act as a bulk data provider, provide a separate mechanism for acquiring the backing dataset in bulk.
	- **Staying up-to-date**: Especially for large datasets, clients may want to keep their dataset up to date without downloading the data set after every change. If this is a use case for the API, prioritize it in the design.
	- **Driving Expensive Actions**: What would happen if a client wanted to automatically send text messages to thousands of people or light up the side of a skyscraper every time a new record appears? Consider whether the API's records will always be in a reliable unchanging order, and whether they tend to appear in clumps or in a steady stream. Generally speaking, consider the "entropy" an API client would experience.
- Notifications for updates and new releases.
	- RSS Feed
- Endpoints:
	- HTTP Verb:
		- `GET`
		- `POST`
		- `PUT`
		- `DELETE`
		- `OPTION`
	- URL Path:
		- `/users/{userId}`
	- Pass information to an endpoint via:
		- URL Query String: `?year=2023`
		- HTTP Headers: `X-Api-Key: mykey`
		- Request Body:
- **Avoid single-endpoint APIs.** Don't jam multiple operations into the same endpoint with the same HTTP verb.
- **Prioritize simplicity.** It should be easy to guess what an endpoint does by looking at the URL and HTTP verb, without needing to see a query string.
- Endpoint URLs should advertise resources, and **avoid verbs**.

## Media Types

### Use JSON

- [JSON](https://en.wikipedia.org/wiki/JSON) is an excellent, widely supported transport format, suitable for many web APIs.
	- Supporting JSON and only JSON is a practical default for APIs, and generally reduces complexity for both the API provider and consumer.
- General JSON guidelines:
	- Responses should be **a JSON object** (not an array). Using an array to return results limits the ability to include metadata about results, and limits the API's ability to add additional top-level keys in the future.
	- **Don't use unpredictable keys**. Parsing a JSON response where keys are unpredictable (e.g. derived from data) is difficult, and adds friction for clients.
	- **Use consistent case for keys**. Whether you use `under_score` or `CamelCase` for your API keys, make sure you are consistent.

### Use UTF-8

- Always [use UTF-8](http://utf8everywhere.org/).
	- Expect accented characters or "smart quotes" in API output, even if they're not expected.
	- An API should tell clients to expect UTF-8 by including a charset notation in the `Content-Type` header for responses.

An API that returns JSON should use:

```
Content-Type: application/json; charset=utf-8
```

### Use Consistent Date Format

- Use **[ISO 8601 UTC](https://xkcd.com/1179/)
	- For just dates, that looks like `2013-02-27`. For full times, that's of the form `2013-02-27T10:00:00Z`.
	- This date format is used all over the web, and puts each field in consistent order -- from least granular to most granular.

## API Keys

- These standards do not take a position on whether or not to use API keys.

- But _if_ keys are used to manage and authenticate API access, the API should allow some sort of unauthenticated access, without keys.

- This allows newcomers to use and experiment with the API in demo environments and with simple `curl`/`wget`/etc. requests.

- Consider whether one of your product goals is to allow a certain level of normal production use of the API without enforcing advanced registration by clients.

## Error Handling

Errors should always respond with the appropriate HTTP status code. Responses with error details should use a `4XX` status code to indicate a client-side failure (such as invalid authorization, or an invalid parameter), and a `5XX` status code to indicate server-side failure (such as an uncaught exception).

Handle all errors (including otherwise uncaught exceptions) and return a data structure in the same format as the rest of the API.

For example, a JSON API might provide the following when a bad request is made:

```json
{
	"code": 400,
	"message": "Bad Request"
}
```

## Pagination

If pagination is required to navigate datasets, use the method that makes the most sense for the API's data.

Some general recommendations around pagination:

1. Allow the API consumer to specify page sizes/limits and the offset/starting point for a page.
2. Provide a link in a paginated response to the next page with a similar size/limit.
3. Allow API consumers to assume that a paginated response without a link to the next page is the last page.

## HTTPS Always

Any new API should use and require [HTTPS encryption](https://en.wikipedia.org/wiki/HTTP_Secure) (using TLS/SSL). HTTPS provides:

- **Security**. The contents of the request are encrypted across the Internet.
- **Authenticity**. A stronger guarantee that a client is communicating with the real API.
- **Privacy**. Enhanced privacy for apps and users using the API. HTTP headers and query string parameters (among other things) will be encrypted.
- **Compatibility**. Broader client-side compatibility. For CORS requests to the API to work on HTTPS websites -- to not be blocked as mixed content -- those requests must be over HTTPS.

HTTPS should be configured using modern best practices, including ciphers that support [forward secrecy](https://en.wikipedia.org/wiki/Forward_secrecy), and [HTTP Strict Transport Security](https://en.wikipedia.org/wiki/HTTP_Strict_Transport_Security). **This is not exhaustive**: use tools like [SSL Labs](https://www.ssllabs.com/ssltest/analyze.html) to evaluate an API's HTTPS configuration.

## CORS

For an API to be used from a website hosted at a different domain, the API must [enable CORS](http://enable-cors.org/).

For read-only and unauthenticated use cases, where the entire API should be accessible from inside the browser, enabling CORS can be accomplished by including this HTTP header in all responses:

```
Access-Control-Allow-Origin: *
```

It's supported by [every modern browser](http://enable-cors.org/client.html), and will Just Work in many JavaScript clients, like [jQuery](https://jquery.com/).

For more advanced configuration, see the [W3C spec](http://www.w3.org/TR/cors/) or [Mozilla's guide](https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS).

## Useful Endpoint Controllers

- `/status`: ⭐
	- `/ping`
	- `/metrics`
	- `/health/`:
		- `/database`
		- `/cache`
		- `/serviceA`
		- `/integrationB`
		- `/queue`
		- `/auth`
- `/sessioninfo`
- `/links`
- `/errors` ⭐

### Status Endpoints

#### Basic Ping Endpoint

- Simple endpoint that returns a minimal response along with a `200` status code (`OK`). Useful for validating the API server is up and running and ready to receive requests.

#### Database Connectivity Endpoint

- Checks the connection to any databases needed by the API. Should perform an actual query that *retrieves some sort of data* to ensure permissions and data retrieval are working.
- Example:

```json
{
	"message": "Database Connection Valid",
	"serverTime": {CURRENT_TIMESTAMP},
	"databaseTime": `SELECT getdate();`,
	"status": 200
}
```

#### Dependency Checks

- Checks reliance on external services (payment gateways, message queues, 3rd party APIs, etc.)

#### Resource Utilization Metrics

- Endpoint that provides information about resource utilization (i.e. CPU and Memory Usage).
- Monitors server health and performance

#### Cache Status Check

- If your API uses caching, you can create an endpoint to check the status of the cache. It can report on cache hit rates, cache size, and the last time the cache was cleared or refreshed.

#### Queue Length and Processing Status

- For APIs that use message queues (e.g., RabbitMQ, Kafka), you can implement an endpoint to check the length of the queue and the status of message processing. This helps ensure that messages are being processed as expected.

#### Authentication and Authorization

- These endpoints can verify that the authentication and authorization systems are functioning correctly. For example, you can test if token validation is working as intended.

Use `/auth` endpoint path with required authorization (API Key, Basic, etc.)

#### Service Dependency Healthchecks

- If your API relies on microservices or other backend services, you can create endpoints that check the health of those services. This includes verifying their availability and responsiveness.

#### Custom Business Logic Checks

- Depending on your application's specific requirements, you can implement custom healthchecks that validate critical business logic. For instance, if your API handles financial transactions, you might have checks to ensure that transactions are being processed accurately.

#### External Integration Checks

- If your API integrates with external systems or third-party APIs, you can create healthcheck endpoints that verify the status of these integrations. This ensures that data exchange with external entities is functioning as expected.

***

*Remember that healthcheck endpoints should return meaningful status information, such as "healthy," "degraded," or "unhealthy," along with relevant details. Implementing a combination of these healthcheck endpoints can help you proactively monitor and troubleshoot issues in your REST API, ensuring its reliability and availability.*

### Error Endpoints

*Errors controller throws errors in order to ensure proper UX/UI and centralized error handling.*

- `/errors/4##`:
	- `/errors/401`
	- `/errors/403`
	- `/errors/404`

- `/errors/5##`
	- `/errors/500`

- Can use these endpoints to ensure that redirects work properly (i.e. if login fails than redirect back to login page)
- Test 404 Not Found Pages

### Performance Endpoints

### Session Information Endpoints
