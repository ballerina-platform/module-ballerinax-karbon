# Work item status report

This example reports on the work in a Karbon tenant. It pages through every work item, prints the details of the most recently started ones, and lists the teams in the firm.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- The **Application ID** of your Karbon API application (sent by Karbon by secure message when the application is first registered) and your tenant's **Access Key** (under **Settings > Connected Apps**)
- Create a `Config.toml` in this directory:

  ```toml
  token = "<Application ID, without the Bearer prefix>"
  accessKey = "<Access key>"
  pageSize = 50
  ```

## Run the example

```bash
bal run
```
