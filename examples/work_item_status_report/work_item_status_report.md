# Work item status report

This example reports on the work in a Karbon tenant. It pages through every work item, prints the details of the most recently started ones, and lists the teams in the firm.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- A Karbon API application with its Authorization (Bearer) token and Access Key, found under **Settings > Connected Apps > API Applications**
- Create a `Config.toml` in this directory:

  ```toml
  token = "<Bearer token>"
  accessKey = "<Access key>"
  pageSize = 50
  ```

## Run the example

```bash
bal run
```
