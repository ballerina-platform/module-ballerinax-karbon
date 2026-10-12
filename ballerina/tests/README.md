# Running Tests

## Prerequisites

The tests run against a local mock server by default and need no credentials.

To run them against the live Karbon API, set the following environment variables:

```bash
export IS_LIVE_SERVER=true
export KARBON_TOKEN="<Bearer token>"
export KARBON_ACCESS_KEY="<Access key>"
```

## Test suite

The suite covers 25 operations: listing and retrieving client groups, contacts, organizations, work items, users, teams, invoices and timesheets, and creating or updating client groups, contacts, organizations, work items, users and notes. Tests that create or update data run in the `mock_tests` group only, so they never change a live tenant.

## Running the tests

* Against the mock server:

    ```bash
    bal test --groups mock_tests
    ```

* Against the live API (read-only tests):

    ```bash
    bal test --groups live_tests
    ```
