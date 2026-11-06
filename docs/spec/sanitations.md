_Author_:  @DimuthuMadushan \
_Created_: 2026/10/12 \
_Updated_: 2026/10/12 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from Karbon. 
The OpenAPI specification is obtained from [wso2/api-specs](https://github.com/wso2/api-specs/blob/main/openapi/karbon/karbon/v3/openapi.json).
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Change the `url` property of the servers object
- **Original**: `https://api.karbonhq.com`
- **Updated**: `https://api.karbonhq.com/v3`
- **Reason**: Common prefix added to base URL to simplify endpoint paths.
<!-- auto-generated -->

2. Update the API Paths
- **Original**: Paths included common prefix `/v3` in each endpoint.
- **Updated**: Common prefix removed from endpoints as it is now in the base URL.
- **Reason**: Simplifies API paths and avoids duplication.
<!-- auto-generated -->

3. Change `DetailsOfAccountingLegalFirm OrganizationKey` to nullable
- **Original**: The `OrganizationKey` field in `DetailsOfAccountingLegalFirm` was `not nullable`.
- **Updated**: The `OrganizationKey` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

4. Change `BillingKarbonPaymentKarbonPayment CardCountry` to nullable
- **Original**: The `CardCountry` field in `BillingKarbonPaymentKarbonPayment` was `not nullable`.
- **Updated**: The `CardCountry` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

5. Change `ClientTeamMember RoleType` to nullable
- **Original**: The `RoleType` field in `ClientTeamMember` was `not nullable`.
- **Updated**: The `RoleType` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

6. Change `PartiallyUpdatedContact AccountingDetail` to nullable
- **Original**: The `AccountingDetail` field in `PartiallyUpdatedContact` was `not nullable`.
- **Updated**: The `AccountingDetail` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

7. Change `PartiallyUpdatedOrganization AccountingDetail` to nullable
- **Original**: The `AccountingDetail` field in `PartiallyUpdatedOrganization` was `not nullable`.
- **Updated**: The `AccountingDetail` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

8. Change `ClientGroupMember ContactKey` to nullable
- **Original**: The `ContactKey` field in `ClientGroupMember` was `not nullable`.
- **Updated**: The `ContactKey` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

9. Change `ClientGroupMember OrganizationKey` to nullable
- **Original**: The `OrganizationKey` field in `ClientGroupMember` was `not nullable`.
- **Updated**: The `OrganizationKey` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

10. Change `ClientAccessItem AccessLevel` to nullable
- **Original**: The `AccessLevel` field in `ClientAccessItem` was `not nullable`.
- **Updated**: The `AccessLevel` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

11. Change `OrganizationListItem UserDefinedIdentifier` to nullable
- **Original**: The `UserDefinedIdentifier` field in `OrganizationListItem` was `not nullable`.
- **Updated**: The `UserDefinedIdentifier` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

12. Change `OrganizationListItem PhoneNumber` to nullable
- **Original**: The `PhoneNumber` field in `OrganizationListItem` was `not nullable`.
- **Updated**: The `PhoneNumber` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

13. Change `UserTeamItem ParentTeamKey` to nullable
- **Original**: The `ParentTeamKey` field in `UserTeamItem` was `not nullable`.
- **Updated**: The `ParentTeamKey` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

14. Change `ClientGroupAccountingDetails AccountingDetails` to nullable
- **Original**: The `AccountingDetails` field in `ClientGroupAccountingDetails` was `not nullable`.
- **Updated**: The `AccountingDetails` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

15. Change `ClientGroupListItem PhoneNumber` to nullable
- **Original**: The `PhoneNumber` field in `ClientGroupListItem` was `not nullable`.
- **Updated**: The `PhoneNumber` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

16. Change `ClientGroupListItem Website` to nullable
- **Original**: The `Website` field in `ClientGroupListItem` was `not nullable`.
- **Updated**: The `Website` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

17. Change `DetailsOfAccountingTaxProvider OrganizationKey` to nullable
- **Original**: The `OrganizationKey` field in `DetailsOfAccountingTaxProvider` was `not nullable`.
- **Updated**: The `OrganizationKey` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

18. Change `WorkFeeSettingsFeeSettings FeeValue` to nullable
- **Original**: The `FeeValue` field in `WorkFeeSettingsFeeSettings` was `not nullable`.
- **Updated**: The `FeeValue` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

19. Change `BillingInvoiceLineItem TaxRateName` to nullable
- **Original**: The `TaxRateName` field in `BillingInvoiceLineItem` was `not nullable`.
- **Updated**: The `TaxRateName` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

20. Change `BillingInvoiceLineItem TaxRate` to nullable
- **Original**: The `TaxRate` field in `BillingInvoiceLineItem` was `not nullable`.
- **Updated**: The `TaxRate` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

21. Change `ContactListItem Address` to nullable
- **Original**: The `Address` field in `ContactListItem` was `not nullable`.
- **Updated**: The `Address` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

22. Change `ContactListItem PhoneNumber` to nullable
- **Original**: The `PhoneNumber` field in `ContactListItem` was `not nullable`.
- **Updated**: The `PhoneNumber` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

23. Change `CreateClientGroupAccountingDetails AccountingDetails` to nullable
- **Original**: The `AccountingDetails` field in `CreateClientGroupAccountingDetails` was `not nullable`.
- **Updated**: The `AccountingDetails` field has been updated to be `nullable`.
- **Reason**: The API can return a null value for this field.
<!-- auto-generated -->

24. Change the `openapi` version from `3.1.0` to `3.0.1`
- **Original**: `"openapi": "3.1.0"`.
- **Updated**: `"openapi": "3.0.1"`.
- **Reason**: `bal openapi flatten` and `align` (2201.13.4) drop `type` from every parameter, schema and property of an OpenAPI 3.1 document, which leaves path parameters with an empty schema and makes client generation crash. No other 3.1-only feature is used (the `webhooks` block is ignored by 3.0.1 tooling).

25. Convert 3.1 nullable type arrays to `nullable: true` (93 entries)
- **Original**: `"type": ["string", "null"]` (and the same form for `object`, `number`, `boolean`, `integer`).
- **Updated**: `"type": "string", "nullable": true` (and the same form for the other types).
- **Reason**: A type array is not valid OpenAPI 3.0.1. The 93 entries are 75 `string`, 7 `object`, 6 `number`, 3 `boolean` and 2 `integer`.

26. Convert a schema `examples` array to `example`
- **Original**: `"examples": ["Agriculture", "Manufacturing", "Professional, Scientific and Technical Services"]` on the string items of the business-card line-of-business list.
- **Updated**: `"example": "Agriculture"`.
- **Reason**: `examples` as an array on a schema is OpenAPI 3.1 only. The first value is kept.

27. Hoist 16 inline `allOf` schemas under `paths` into 14 named schemas in `components/schemas`
- **Original**: Response and request-body schemas written as an inline `allOf` that mixes `$ref`s with inline objects, mostly adding `@odata.context`.
- **Updated**: Each location now has a `$ref` to a named schema holding the same `allOf`: `InvoiceResponse` (`GET /Invoices/{InvoiceKey}`), `PaymentResponse` (`GET /Payments/{PaymentKey}`), `BusinessCardResponse` (`GET /BusinessCards/{BusinessCardKey}`), `UpdateBusinessCardRequest` (`PUT /BusinessCards/{BusinessCardKey}`), `ClientGroupDetails` (the 200 response of `POST /ClientGroups`, `GET /ClientGroups/GetClientGroupByUserDefinedIdentifier(...)` and `GET /ClientGroups/{ClientGroupkey}`), `CreateClientGroupRequest` (`POST /ClientGroups` body), `UpdateClientGroupRequest` (`PUT /ClientGroups/{ClientGroupkey}` body), `OrganizationDetails` (`GET /Organizations/{Organizationkey}`), `TimesheetResponse` (`GET /Timesheets/{Timesheetkey}`), `IndividualTimeEntryResponse` (`GET /IndividualTimeEntries/{IndividualTimeEntryKey}`), `UserResponse` (`POST /Users`), `CreatedWorkItem` (`POST /WorkItems`), `WorkItemDetails` (`GET /WorkItems/{WorkItemKey}`) and `WorkTemplateResponse` (`GET /WorkTemplates/{WorkTemplatekey}`).
- **Reason**: `bal openapi flatten` names an inline `allOf` after its path and builds a regular expression from that name, so a path containing `{...}` crashes it with `PatternSyntaxException: Illegal repetition`.

28. Remove a duplicated `EntityType`/`EntityKey` member from `BusinessCardResponse`
- **Original**: The `allOf` of the business card response declared `EntityType` and `EntityKey` in an inline member and again through the `BusinessCard` schema.
- **Updated**: The inline member is dropped; both properties come from `BusinessCard`.
- **Reason**: The same property declared twice across `allOf` members produces a "redeclared symbol" compilation error.

29. Remove the `default` from four `$orderby` parameters
- **Original**: `GET /ClientGroups` (the variant with an enum), `GET /Organizations`, `GET /Timesheets` and `GET /WorkItems` declared a `default` such as `ClientGroupKey` or `TimesheetKey` that is not in the parameter's `enum`.
- **Updated**: The `default` is removed.
- **Reason**: A default outside the enum does not compile in the generated `types.bal`.

30. Strip the `dollar` prefix from OData parameter names in the aligned spec (re-apply after a re-align)
- **Original**: `align` writes `x-ballerina-name` as `dollarCount`, `dollarExpand`, `dollarFilter`, `dollarOrderby`, `dollarSkip` and `dollarTop` for the `$count`, `$expand`, `$filter`, `$orderby`, `$skip` and `$top` parameters.
- **Updated**: In `docs/spec/aligned_ballerina_openapi.json` the names are `count`, `expand`, `filter`, `orderby`, `skip` and `top`.
- **Reason**: The client's query parameters read as `filter`, `skip` and `top` instead of `dollarFilter`, `dollarSkip` and `dollarTop`. This edit is made to the aligned spec only, so it must be re-applied after every re-align.

31. Declare `BearerAuth` as an `apiKey` security scheme
- **Original**: `BearerAuth` is `{"type": "http", "scheme": "bearer", "bearerFormat": "JWT"}`.
- **Updated**: `BearerAuth` is `{"type": "apiKey", "in": "header", "name": "Authorization"}`, with the description saying the value is sent as `Bearer <application ID>`. `ApiKeyAuth` (`AccessKey`) and the top-level `security` requiring both schemes are unchanged.
- **Reason**: `bal openapi` cannot express an http-bearer scheme AND an apiKey scheme together; it generates an `auth` union of the two, so only one of them is ever sent. With every scheme an `apiKey`, the client gets one `ApiKeysConfig` (`authorization` and `accessKey`) that is applied to every call.

32. Replace `info.description` with a single sentence
- **Original**: A long text with a link to a non-existent `KARBON_API.md`, an OData primer, an "examples are illustrative" warning and instructions for sending the credentials as headers.
- **Updated**: "The Karbon API provides access to a Karbon practice-management account, including contacts, organizations, client groups, work items, timesheets, invoices and payments."
- **Reason**: `info.description` becomes the `Client` class doc comment. The original text pointed at a missing file and described header-level credentials, which no longer match the `ApiKeysConfig` constructor.

33. Send the `uploadFile` multipart payload without converting it to JSON (generated code, re-apply after a regenerate)
- **Original**: `uploadFile` in `ballerina/client.bal` builds its parts with `createBodyParts(check jsondata:toJson(payload).ensureType())`, and `createBodyParts` in `ballerina/utils.bal` names each part after its record field.
- **Updated**: `uploadFile` passes the typed payload, `createBodyParts(payload, fieldNames = {...})`, with a map from record fields to the wire names in the `@jsondata:Name` annotations (`integration_task_key`, `contact_keys`, `client_group_keys`, `organization_keys`, `workitem_keys`). `createBodyParts` takes that `fieldNames` map as a new optional parameter and uses `fieldNames[key] ?: key` as the part name.
- **Reason**: `toJson` turns the `file` record's `byte[]` into a JSON integer array, so it no longer matches the file-part branch and the file is sent as its string form. No spec change avoids this, since the spec's property names have to stay as they are on the wire. This is a hand edit to generated `.bal` files, so it must be re-applied after every client regeneration.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be executed from the repository root directory.

```bash
bal openapi -i docs/spec/aligned_ballerina_openapi.json --mode client --license docs/license.txt -o ballerina --client-methods remote
```

Note: The license year is hardcoded to 2026, change if necessary.
