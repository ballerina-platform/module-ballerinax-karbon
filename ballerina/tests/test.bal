// Copyright (c) 2026, WSO2 LLC. (http://www.wso2.com).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/os;
import ballerina/test;

final boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";
final string serviceUrl = isLiveServer ? "https://api.karbonhq.com/v3" : "http://localhost:9090";
final string token = isLiveServer ? os:getEnv("KARBON_TOKEN") : "test_token";
final string accessKey = isLiveServer ? os:getEnv("KARBON_ACCESS_KEY") : "test_access_key";

final Client karbon = check new (
    {authorization: "Bearer " + token, accessKey},
    {httpVersion: isLiveServer ? http:HTTP_2_0 : http:HTTP_1_1},
    serviceUrl
);

// Client groups

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListClientGroups() returns error? {
    GetClientGroup response = check karbon->listClientGroups();
    test:assertTrue(response.value.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetClientGroup() returns error? {
    GetClientGroup list = check karbon->listClientGroups();
    string clientGroupKey = list.value[0].clientGroupKey;
    ClientGroupDetails response = check karbon->getClientGroup(clientGroupKey);
    test:assertEquals(response.clientGroupKey, clientGroupKey);
}

@test:Config {groups: ["mock_tests"]}
function testCreateClientGroup() returns error? {
    ClientGroupDetails response = check karbon->createClientGroup({fullName: "Harbour Bicycle Rentals"});
    test:assertEquals(response.fullName, "Harbour Bicycle Rentals");
}

@test:Config {groups: ["mock_tests"]}
function testUpdateClientGroup() returns error? {
    check karbon->updateClientGroup("38zlxNyJSr8y", {fullName: "Abigail Silvers Group"});
}

// Contacts

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListContacts() returns error? {
    GetContacts response = check karbon->listContacts();
    test:assertTrue(response.value.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetContact() returns error? {
    GetContacts list = check karbon->listContacts();
    string contactKey = list.value[0].contactKey;
    ResponseCreateContact response = check karbon->getContact(contactKey);
    test:assertEquals(response.contactKey, contactKey);
}

@test:Config {groups: ["mock_tests"]}
function testCreateContact() returns error? {
    ResponseCreateContact response = check karbon->createContact({firstName: "Duncan", lastName: "Moore"});
    test:assertEquals(response.lastName, "Moore");
}

@test:Config {groups: ["mock_tests"]}
function testPartiallyUpdateContact() returns error? {
    PartiallyUpdatedContact response = check karbon->partiallyUpdateContact("CFbcmM5Lvzc", {firstName: "Dunc"});
    test:assertEquals(response.firstName, "Dunc");
}

// Organizations

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListOrganizations() returns error? {
    GetOrganizations response = check karbon->listOrganizations();
    test:assertTrue(response.value.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetOrganization() returns error? {
    GetOrganizations list = check karbon->listOrganizations();
    string organizationKey = list.value[0].organizationKey;
    OrganizationDetails response = check karbon->getOrganization(organizationKey);
    test:assertEquals(response.organizationKey, organizationKey);
}

@test:Config {groups: ["mock_tests"]}
function testCreateOrganization() returns error? {
    CreateOrganizationResponse response = check karbon->createOrganization({fullName: "Acme Corp"});
    test:assertEquals(response.fullName, "Acme Corp");
}

// Work items

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListWorkItems() returns error? {
    GetWorkItems response = check karbon->listWorkItems();
    test:assertTrue(response.value.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetWorkItem() returns error? {
    GetWorkItems list = check karbon->listWorkItems();
    string workItemKey = list.value[0].workItemKey;
    WorkItemDetails response = check karbon->getWorkItem(workItemKey);
    test:assertEquals(response.workItemKey, workItemKey);
}

@test:Config {groups: ["mock_tests"]}
function testCreateWorkItem() returns error? {
    CreatedWorkItem response = check karbon->createWorkItem({
        clientKey: "ZGNmtYyLm4z",
        clientType: "Organization",
        title: "FY24 Income Tax Return",
        startDate: "2024-07-01T00:00:00Z",
        assigneeEmailAddress: "jessica.tse@samplecompany.com"
    });
    test:assertEquals(response.title, "FY24 Income Tax Return");
}

@test:Config {groups: ["mock_tests"]}
function testPartiallyUpdateWorkItem() returns error? {
    check karbon->partiallyUpdateWorkItem("3rYbDq7WmKpZ", <UpdateWorkItemTitle>{Title: "FY24 Tax Return (revised)"});
}

// Users and teams

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListUsers() returns error? {
    GetUsers response = check karbon->listUsers();
    test:assertTrue(response.value.length() > 0);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetUser() returns error? {
    GetUsers list = check karbon->listUsers();
    string userId = list.value[0].id;
    GetUserById response = check karbon->getUser(userId);
    test:assertEquals(response.id, userId);
}

@test:Config {groups: ["mock_tests"]}
function testCreateUser() returns error? {
    UserResponse response = check karbon->createUser({name: "Jessica Tse", emailAddress: "jessica.tse@samplecompany.com"});
    test:assertEquals(response.emailAddress, "jessica.tse@samplecompany.com");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListTeams() returns error? {
    GetTeams response = check karbon->listTeams();
    test:assertTrue(response?.value is Team[]);
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testGetTeam() returns error? {
    GetTeams list = check karbon->listTeams();
    Team[] teams = list?.value ?: [];
    test:assertTrue(teams.length() > 0);
    TeamProfile response = check karbon->getTeam(teams[0].teamKey);
    test:assertEquals(response.teamKey, teams[0].teamKey);
}

// Invoices, timesheets and notes

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListInvoices() returns error? {
    InvoiceList response = check karbon->listInvoices();
    test:assertTrue(response?.values is BillingInvoice[]);
}

@test:Config {groups: ["mock_tests"]}
function testGetInvoice() returns error? {
    InvoiceResponse response = check karbon->getInvoice("M2dVbCt4RHk");
    test:assertEquals(response.invoiceKey, "M2dVbCt4RHk");
}

@test:Config {groups: ["live_tests", "mock_tests"]}
function testListTimesheets() returns error? {
    GetTimeSheets response = check karbon->listTimesheets();
    test:assertTrue(response.value.length() >= 0);
}

@test:Config {groups: ["mock_tests"]}
function testGetNote() returns error? {
    NoteResponse response = check karbon->getNote("2kLmNp4QrStU");
    test:assertEquals(response.id, "2kLmNp4QrStU");
}

@test:Config {groups: ["mock_tests"]}
function testCreateNote() returns error? {
    NoteResponse response = check karbon->createNote({
        subject: "Follow up on tax return",
        body: "Call the client to confirm the missing documents.",
        authorEmailAddress: "jessica.tse@samplecompany.com"
    });
    test:assertEquals(response.subject, "Follow up on tax return");
}
