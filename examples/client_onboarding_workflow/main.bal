import ballerina/io;
import ballerinax/karbon;

configurable string token = ?;
configurable string accessKey = ?;
configurable string organizationName = ?;
configurable string workItemTitle = ?;
configurable string workItemStartDate = ?;
configurable string assigneeEmailAddress = ?;
configurable string noteAuthorEmailAddress = ?;

public function main() returns error? {
    karbon:Client karbonClient = check new ({authorization: "Bearer " + token, accessKey});

    // Step 1: create the client organization
    karbon:CreateOrganizationResponse organization = check karbonClient->createOrganization({fullName: organizationName});
    io:println("Created organization ", organization.fullName, " with key ", organization.organizationKey);

    // Step 2: open the onboarding work item for the new client
    karbon:CreatedWorkItem workItem = check karbonClient->createWorkItem({
        clientKey: organization.organizationKey,
        clientType: "Organization",
        title: workItemTitle,
        startDate: workItemStartDate,
        assigneeEmailAddress
    });
    io:println("Created work item ", workItem.title, " with key ", workItem.workItemKey);

    // Step 3: leave a note for the team on the new work item's timeline
    karbon:NoteResponse note = check karbonClient->createNote({
        subject: "Onboarding started for " + organization.fullName,
        body: "Work item " + workItem.workItemKey + " has been created. Please collect the engagement documents.",
        authorEmailAddress: noteAuthorEmailAddress,
        assigneeEmailAddress,
        timelines: [{entityType: "WorkItem", entityKey: workItem.workItemKey}]
    });
    io:println("Created note ", note.id ?: "");
}
