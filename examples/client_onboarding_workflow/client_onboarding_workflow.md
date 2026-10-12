# Client onboarding workflow

This example onboards a new client in Karbon. It creates the client organization, opens an onboarding work item for it, and leaves a note so the assigned team knows the work has started.

## Prerequisites

- Ballerina Swan Lake 2201.12.0 or later
- The **Application ID** of your Karbon API application (sent by Karbon by secure message when the application is first registered) and your tenant's **Access Key** (under **Settings > Connected Apps**)
- Create a `Config.toml` in this directory:

  ```toml
  token = "<Application ID, without the Bearer prefix>"
  accessKey = "<Access key>"
  organizationName = "<Client organization name>"
  workItemTitle = "<Onboarding work item title>"
  workItemStartDate = "<Start date, e.g. 2026-11-01T00:00:00Z>"
  assigneeEmailAddress = "<Email address of the assignee>"
  noteAuthorEmailAddress = "<Email address of the note author>"
  ```

## Run the example

```bash
bal run
```
