import ballerina/io;
import ballerinax/karbon;

configurable string token = ?;
configurable string accessKey = ?;
configurable int pageSize = 50;

public function main() returns error? {
    karbon:Client karbonClient = check new ({authorization: "Bearer " + token, accessKey});

    // Step 1: page through every work item, following $skip until a short page is returned
    karbon:WorkItemListItem[] workItems = [];
    int skip = 0;
    while true {
        karbon:GetWorkItems page = check karbonClient->listWorkItems(skip = skip, top = pageSize, orderby = "StartDate desc");
        karbon:WorkItemListItem[] more = page.value;
        workItems.push(...more);
        if more.length() < pageSize {
            break;
        }
        skip += pageSize;
    }
    io:println("Work items found: ", workItems.length());

    // Step 2: fetch the details of the five most recently started work items
    int detailCount = workItems.length() < 5 ? workItems.length() : 5;
    foreach int i in 0 ..< detailCount {
        karbon:WorkItemDetails detail = check karbonClient->getWorkItem(workItems[i].workItemKey);
        io:println(detail.title, " (starts ", detail.startDate, ")");
    }

    // Step 3: list the teams that the work is distributed across
    karbon:GetTeams teams = check karbonClient->listTeams();
    foreach karbon:Team team in teams?.value ?: [] {
        io:println("Team: ", team.name);
    }
}
