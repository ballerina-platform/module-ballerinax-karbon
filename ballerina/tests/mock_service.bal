
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

listener http:Listener ep0 = new (9090);

const string ODATA_BASE = "https://api.karbonhq.com/v3/$metadata";

@http:ServiceConfig {treatNilableAsOptional: true}
service / on ep0 {
    # Gets a list of Client Groups
    #
    # + filter - Filter expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + orderby - Sort expression
    # + return - The list of Client Groups
    resource function get ClientGroups(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top, @http:Query {name: "$orderby"} string orderby = "ClientGroupKey") returns GetClientGroup|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#ClientGroups",
            atOdataCount: 2,
            value: [
                {clientGroupKey: "38zlxNyJSr8y", fullName: "Abigail Silvers", lastModifiedDateTime: "2024-03-12T07:30:13Z"},
                {clientGroupKey: "4Q2mTzcBd7Lx", fullName: "Harbour Bicycle Rentals", lastModifiedDateTime: "2024-04-02T10:12:45Z"}
            ]
        };
    }

    # Gets a Client Group using ClientGroupkey
    #
    # + clientGroupkey - The Client Group key
    # + expand - Related entities to include
    # + return - The Client Group
    resource function get ClientGroups/[string clientGroupkey](@http:Query {name: "$expand"} string? expand) returns ClientGroupDetails|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#ClientGroups/$entity",
            clientGroupKey: clientGroupkey,
            fullName: "Abigail Silvers",
            userDefinedIdentifier: "SILVERS",
            clientOwner: "rodney.muller@samplecompany.com",
            clientManager: "jessica.tse@samplecompany.com",
            contactType: "Client",
            restrictionLevel: "Public",
            primaryContact: "Duncan Moore"
        };
    }

    # Gets a list of Contacts
    #
    # + filter - Filter expression
    # + orderby - Sort expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + return - The list of Contacts
    resource function get Contacts(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$orderby"} "FullName"|"FullName desc"|"LastModifiedDateTime"|"LastModifiedDateTime desc"? orderby, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top) returns GetContacts|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Contacts",
            atOdataCount: 2,
            value: [
                {contactKey: "CFbcmM5Lvzc", fullName: "Duncan Moore", lastModifiedDateTime: "2024-03-12T07:30:13Z"},
                {contactKey: "9Wq2LkPxT4vA", fullName: "Priya Nair", lastModifiedDateTime: "2024-05-21T14:02:09Z"}
            ]
        };
    }

    # Gets a Contact using Contactkey
    #
    # + contactkey - The Contact key
    # + expand - Related entities to include
    # + return - The Contact
    resource function get Contacts/[string contactkey](@http:Query {name: "$expand"} "BusinessCards"|"ClientTeam"|"ClientAccess"|"ServiceTypes"? expand) returns ResponseCreateContact|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Contacts/$entity",
            contactKey: contactkey,
            firstName: "Duncan",
            lastName: "Moore",
            userDefinedIdentifier: "MOORE",
            clientOwner: "rodney.muller@samplecompany.com",
            contactType: "Client",
            restrictionLevel: "Public"
        };
    }

    # Gets a list of Invoices
    #
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + filter - Filter expression
    # + orderby - Sort expression
    # + return - The list of Invoices
    resource function get Invoices(@http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top, @http:Query {name: "$filter"} string? filter, @http:Query {name: "$orderby"} string? orderby) returns InvoiceList|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests {
        InvoiceList tmpList = {
            "@odata.context": ODATA_BASE + "#Invoices",
            "@odata.count": 1,
            values: [
                {
                    invoiceKey: "M2dVbCt4RHk",
                    invoiceNumber: "KIN-1001",
                    invoiceDate: "2023-07-21T00:00:00Z",
                    paymentDueDate: "2023-07-28T00:00:00Z",
                    updatedAt: "2023-07-20T23:52:11Z",
                    currencyCode: "AUD",
                    invoiceSubTotal: 1397.50d,
                    invoiceTaxTotal: 209.63d,
                    invoiceTotal: 1607.13d,
                    totalAmountDue: 1607.13d,
            invoiceStatus: "AwaitingPayment",
                    Client: {clientKey: "2xxnBLyCP4Ts", name: "Acme Corp", clientType: "Organization"}
                }
            ]
        };
        return tmpList;
    }

    # Gets a single Invoice
    #
    # + invoiceKey - The Invoice key
    # + expand - Related entities to include
    # + return - The Invoice
    resource function get Invoices/[string invoiceKey](@http:Query {name: "$expand"} "LineItems"|"Payments"|"Data"|"LineItems,Data"|"LineItems,Payments"|"LineItems,Payments,Data"|"Payments,Data"? expand) returns InvoiceResponse|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests {
        InvoiceResponse tmpInv = {
            atOdataContext: ODATA_BASE + "#Invoices/$entity",
            invoiceKey,
            invoiceNumber: "KIN-1001",
            invoiceDate: "2023-07-21T00:00:00Z",
            paymentDueDate: "2023-07-28T00:00:00Z",
            updatedAt: "2023-07-20T23:52:11Z",
            currencyCode: "AUD",
            invoiceSubTotal: 1397.50d,
            invoiceTaxTotal: 209.63d,
            invoiceTotal: 1607.13d,
            totalAmountDue: 1607.13d,
            invoiceStatus: "AwaitingPayment",
            Client: {clientKey: "2xxnBLyCP4Ts", name: "Acme Corp", clientType: "Organization"},
            lineItems: [
                {lineItemKey: "li-001", description: "Monthly bookkeeping", quantity: 1d, unitPrice: "1397.50", amount: 1397.50d, billableItemType: "Entity"}
            ],
            payments: []
        };
        return tmpInv;
    }

    # Gets a Note using NoteID
    #
    # + noteID - The Note identifier
    # + return - The Note
    resource function get Notes/[string noteID]() returns NoteResponse|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Notes/$entity",
            id: noteID,
            subject: "Follow up on tax return",
            body: "Call the client to confirm the missing documents.",
            authorEmailAddress: "jessica.tse@samplecompany.com",
            assigneeEmailAddress: "rodney.muller@samplecompany.com",
            dueDate: "2024-06-30T00:00:00Z"
        };
    }

    # Gets a list of Organizations
    #
    # + filter - Filter expression
    # + orderby - Sort expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + return - The list of Organizations
    resource function get Organizations(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$orderby"} "FullName"|"FullName desc"|"LastModifiedDateTime"|"LastModifiedDateTime desc"? orderby, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top) returns GetOrganizations|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Organizations",
            atOdataCount: 2,
            value: [
                {organizationKey: "ZGNmtYyLm4z", fullName: "Acme Corp", lastModifiedDateTime: "2024-02-10T09:15:00Z"},
                {organizationKey: "X6Hm1D2Jvxf", fullName: "Northwind Traders", lastModifiedDateTime: "2024-04-18T16:40:21Z"}
            ]
        };
    }

    # Gets an Organization using Organizationkey
    #
    # + organizationkey - The Organization key
    # + expand - Related entities to include
    # + return - The Organization
    resource function get Organizations/[string organizationkey](@http:Query {name: "$expand"} string? expand) returns OrganizationDetails|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Organizations/$entity",
            organizationKey: organizationkey,
            fullName: "Acme Corp",
            userDefinedIdentifier: "ACME"
        };
    }

    # Gets a list of Teams
    #
    # + filter - Filter expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + return - The list of Teams
    resource function get Teams(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top) returns GetTeams|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Teams",
            atOdataCount: 2,
            value: [
                {teamKey: "7Hk2PqRz9LmN", name: "Tax"},
                {teamKey: "3Bv8XcTy5WdQ", name: "Advisory"}
            ]
        };
    }

    # Gets a single Team, including its members
    #
    # + teamKey - The Team key
    # + return - The Team
    resource function get Teams/[string teamKey]() returns TeamProfile|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {teamKey, name: "Tax"};
    }

    # Gets a list of Timesheets
    #
    # + filter - Filter expression
    # + orderby - Sort expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + expand - Related entities to include
    # + return - The list of Timesheets
    resource function get Timesheets(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$orderby"} "StartDate"|"StartDate desc"|"EndDate"|"EndDate desc"? orderby, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top, @http:Query {name: "$expand"} "TimeEntries"? expand) returns GetTimeSheets|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Timesheets",
            atOdataCount: 1,
            value: [
                {timesheetKey: "5Rt9YhGq2NcE", userKey: "4LR9qmR5NQ6T", startDate: "2024-06-03T00:00:00Z", endDate: "2024-06-09T00:00:00Z", status: "Submitted"}
            ]
        };
    }

    # Gets a list of Users
    #
    # + filter - Filter expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + return - The list of Users
    resource function get Users(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top) returns GetUsers|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Users",
            atOdataCount: 2,
            value: [
                {id: "4LR9qmR5NQ6T", name: "Jessica Tse", emailAddress: "jessica.tse@samplecompany.com"},
                {id: "8Zp3VnKd6HfS", name: "Rodney Muller", emailAddress: "rodney.muller@samplecompany.com"}
            ]
        };
    }

    # Gets the details of a single User
    #
    # + userId - The User identifier
    # + return - The User
    resource function get Users/[string userId]() returns GetUserById|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Users/$entity",
            id: userId,
            name: "Jessica Tse",
            emailAddress: "jessica.tse@samplecompany.com",
            capacityMinutesPerWeek: 2400,
            billableRate: 180.0d
        };
    }

    # Gets a list of Work Items
    #
    # + filter - Filter expression
    # + orderby - Sort expression
    # + skip - Skip the first n items
    # + top - Limit the number of items returned
    # + return - The list of Work Items
    resource function get WorkItems(@http:Query {name: "$filter"} string? filter, @http:Query {name: "$orderby"} "StartDate"|"StartDate desc"|"DeadlineDate"|"DeadlineDate desc"? orderby, @http:Query {name: "$skip"} int? skip, @http:Query {name: "$top"} int? top) returns GetWorkItems|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#WorkItems",
            atOdataCount: 2,
            value: [
                {workItemKey: "3rYbDq7WmKpZ", clientKey: "ZGNmtYyLm4z", title: "FY24 Income Tax Return", startDate: "2024-07-01T00:00:00Z"},
                {workItemKey: "6TgHs1NvXcLe", clientKey: "38zlxNyJSr8y", title: "Quarterly BAS", startDate: "2024-07-15T00:00:00Z"}
            ]
        };
    }

    # Gets a Work Item using WorkItemKey
    #
    # + workItemKey - The Work Item key
    # + return - The Work Item
    resource function get WorkItems/[string workItemKey]() returns WorkItemDetails|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            workItemKey,
            clientKey: "ZGNmtYyLm4z",
            title: "FY24 Income Tax Return",
            startDate: "2024-07-01T00:00:00Z"
        };
    }

    # Updates a Contact (Partial)
    #
    # + contactkey - The Contact key
    # + payload - The Contact fields to update
    # + return - The updated Contact
    resource function patch Contacts/[string contactkey](@http:Payload PartialContactUpdateRequest payload) returns PartiallyUpdatedContact|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesForbidden|ResourceNotFoundNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError|ErrorMessagesConflict {
        return {
            atOdataContext: ODATA_BASE + "#Contacts/$entity",
            contactKey: contactkey,
            firstName: payload.firstName ?: "Duncan",
            lastName: payload.lastName ?: "Moore",
            userDefinedIdentifier: "MOORE",
            restrictionLevel: "Public"
        };
    }

    # Updates a Work Item (Partial)
    #
    # + workItemKey - The Work Item key
    # + payload - The Work Item fields to update
    # + return - No content
    resource function patch WorkItems/[string workItemKey](@http:Payload UpdateWorkItem payload) returns http:NoContent|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ResourceNotFoundNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError|ErrorMessagesConflict {
        return http:NO_CONTENT;
    }

    # Creates a new Client Group
    #
    # + payload - The Client Group to create
    # + return - The created Client Group
    resource function post ClientGroups(@http:Payload CreateClientGroupRequest payload) returns ClientGroupDetailsOk|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        ClientGroupDetailsOk created = {
            body: {
                atOdataContext: ODATA_BASE + "#ClientGroups/$entity",
                clientGroupKey: "38zlxNyJSr8y",
                fullName: payload.fullName,
                userDefinedIdentifier: "SILVERS",
                restrictionLevel: "Public"
            },
            headers: {Location: "https://api.karbonhq.com/v3/ClientGroups('38zlxNyJSr8y')"}
        };
        return created;
    }

    # Creates a new Contact
    #
    # + payload - The Contact to create
    # + return - The created Contact
    resource function post Contacts(@http:Payload CreateContact payload) returns ResponseCreateContact|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesForbidden|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Contacts/$entity",
            contactKey: "CFbcmM5Lvzc",
            firstName: payload.firstName,
            lastName: payload.lastName,
            userDefinedIdentifier: "MOORE",
            restrictionLevel: "Public"
        };
    }

    # Creates a new Note
    #
    # + payload - The Note to create
    # + return - The created Note
    resource function post Notes(@http:Payload NoteRequest payload) returns NoteResponse|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Notes/$entity",
            id: "2kLmNp4QrStU",
            subject: payload.subject,
            body: payload.body,
            authorEmailAddress: payload.authorEmailAddress,
            assigneeEmailAddress: payload.assigneeEmailAddress ?: payload.authorEmailAddress
        };
    }

    # Creates a new Organization
    #
    # + payload - The Organization to create
    # + return - The created Organization
    resource function post Organizations(@http:Payload CreateOrganization payload) returns CreateOrganizationResponse|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ErrorMessagesForbidden|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            atOdataContext: ODATA_BASE + "#Organizations/$entity",
            organizationKey: "ZGNmtYyLm4z",
            fullName: payload.fullName,
            userDefinedIdentifier: "ACME"
        };
    }

    # Creates a new User
    #
    # + payload - The User to create
    # + return - The created User
    resource function post Users(@http:Payload CreateUserRequest payload) returns UserResponseOk|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        UserResponseOk created = {
            body: {
                id: "4LR9qmR5NQ6T",
                name: payload.name,
                emailAddress: payload.emailAddress
            },
            headers: {Location: "https://api.karbonhq.com/v3/Users('4LR9qmR5NQ6T')"}
        };
        return created;
    }

    # Creates a new Work Item
    #
    # + payload - The Work Item to create
    # + return - The created Work Item
    resource function post WorkItems(@http:Payload CreateWorkItemRequest payload) returns CreatedWorkItem|EnhancedOrStandardErrorMessagesBadRequest|ResourceNotFoundUnauthorized|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError {
        return {
            workItemKey: "3rYbDq7WmKpZ",
            clientKey: payload.clientKey,
            title: payload.title,
            startDate: payload.startDate
        };
    }

    # Updates a Client Group (Full)
    #
    # + clientGroupkey - The Client Group key
    # + payload - The full Client Group details
    # + return - No content
    resource function put ClientGroups/[string clientGroupkey](@http:Payload UpdateClientGroupRequest payload) returns http:NoContent|ErrorMessagesBadRequest|ResourceNotFoundUnauthorized|ResourceNotFoundNotFound|RateLimitErrorMessageTooManyRequests|ErrorMessagesInternalServerError|ErrorMessagesConflict {
        return http:NO_CONTENT;
    }
}

// Service-mode response types. `bal openapi --mode client` collapses 4XX/5XX
// to `error` and never emits these, so they are defined here for the mock only.
public type ClientGroupDetailsOk record {|
    *http:Ok;
    ClientGroupDetails body;
    record {|string Location?;|} headers;
|};

public type EnhancedOrStandardErrorMessagesBadRequest record {|
    *http:BadRequest;
    EnhancedOrStandardErrorMessages body;
|};

public type ErrorMessagesBadRequest record {|
    *http:BadRequest;
    ErrorMessages body;
|};

public type ErrorMessagesConflict record {|
    *http:Conflict;
    ErrorMessages body;
|};

public type ErrorMessagesForbidden record {|
    *http:Forbidden;
    ErrorMessages body;
|};

public type ErrorMessagesInternalServerError record {|
    *http:InternalServerError;
    ErrorMessages body;
|};

public type ErrorMessagesNotFound record {|
    *http:NotFound;
    ErrorMessages body;
|};

public type RateLimitErrorMessageTooManyRequests record {|
    *http:TooManyRequests;
    RateLimitErrorMessage body;
|};

public type ResourceNotFoundNotFound record {|
    *http:NotFound;
    ResourceNotFound body;
|};

public type ResourceNotFoundUnauthorized record {|
    *http:Unauthorized;
    ResourceNotFound body;
|};

public type UserResponseOk record {|
    *http:Ok;
    UserResponse body;
    record {|string Location?;|} headers;
|};

public type EnhancedOrStandardErrorMessages ErrorMessages;

# The details of an error associated with an API request
public type ErrorMessages record {
    ErrorMessagesError 'error;
};

# The error message returned when the API rate limit is hit
public type RateLimitErrorMessage record {
    # The error message
    string message?;
    # The generic HTTP Error code
    string? statusCode?;
};

# A generic response shown when the API cannot find a requested entity
public type ResourceNotFound record {
    # The error message
    string message?;
    # The generic HTTP Error code
    string? statusCode?;
};

public type ErrorMessagesError record {
    # A Karbon-generated code to identify the error
    string code;
    # The error message
    string message;
};
