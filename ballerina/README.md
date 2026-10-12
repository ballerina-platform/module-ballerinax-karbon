## Overview

The Karbon connector lets Ballerina applications work with the [Karbon](https://karbonhq.com/) practice management platform through its [Karbon API](https://developers.karbonhq.com/). It supports version 3 of the API, which accounting and professional services firms use to manage clients, work, teams, time and billing.

### Key features

- Manage client records: contacts, organizations and client groups, including their business cards
- Create, update and track work items, work schedules and work templates
- Retrieve teams, users, roles, timesheets and individual time entries
- Read invoices and payments, and record or reverse manual payments
- Upload, list and download files, and attach notes and comments to client work
- Subscribe to webhooks and manage custom fields and integration tasks

## Setup guide

To use the connector, you need a Karbon account with API access enabled.

1. Sign in to Karbon and open **Settings > Connected Apps > API Applications**.

2. Create an API application, or open an existing one, and copy its **Authorization (Bearer) token**.

3. From the same page, copy the **Access Key** for your Karbon tenant.

> **Note:** Karbon expects both values on every request. Provide them once when you create the client: the connector sends the bearer token in the `Authorization` header (as `Bearer <token>`) and the access key in the `AccessKey` header.

## Quickstart

To use the Karbon connector in your Ballerina application, update the `.bal` file as follows:

### Step 1: Import the module

```ballerina
import ballerinax/karbon;
```

### Step 2: Create a `Config.toml` file

```toml
token = "<Bearer token>"
accessKey = "<Access key>"
```

### Step 3: Create a client

```ballerina
configurable string token = ?;
configurable string accessKey = ?;

final karbon:Client karbonClient = check new ({authorization: "Bearer " + token, accessKey});
```

### Step 4: Invoke an operation

```ballerina
public function main() returns error? {
    karbon:GetWorkItems _ = check karbonClient->listWorkItems(top = 10);
}
```

## Examples

The Karbon connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-karbon/tree/main/examples/), covering the following use cases:

1. [Client onboarding workflow](https://github.com/ballerina-platform/module-ballerinax-karbon/tree/main/examples/client_onboarding_workflow) - Creates a client organization, opens an onboarding work item for it and leaves a note for the team.
2. [Work item status report](https://github.com/ballerina-platform/module-ballerinax-karbon/tree/main/examples/work_item_status_report) - Pages through all work items, prints the latest ones in detail and lists the firm's teams.
