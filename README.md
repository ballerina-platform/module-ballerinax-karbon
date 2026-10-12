# Ballerina Karbon connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-karbon/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-karbon/actions/workflows/ci.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-karbon.svg)](https://github.com/ballerina-platform/module-ballerinax-karbon/commits/main)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/karbon.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fkarbon)

## Overview

The Karbon connector lets Ballerina applications work with the [Karbon](https://karbonhq.com/) practice management platform through its [Karbon API](https://developers.karbonhq.com/). It supports version 3 of the API, which accounting and professional services firms use to manage clients, work, teams, time and billing.

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

## Build from the source

### Setting up the prerequisites

1. Download and install Java SE Development Kit (JDK) version 21. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

4. Export Github Personal access token with read package permissions as follows,

    ```bash
    export packageUser=<Username>
    export packagePAT=<Personal access token>
    ```

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environments:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug the package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`karbon` package](https://central.ballerina.io/ballerinax/karbon/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
