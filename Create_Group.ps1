$Env:AZURE_CLIENT_ID = $appId
$Env:AZURE_TENANT_ID = $tenantId
$Env:AZURE_CLIENT_SECRET = $appSecret

# Tell Connect-MgGraph to use your environment variables.
Connect-MgGraph -EnvironmentVariable



$displayName= "AzureDevops01" # Nome da política
$description = "Grupo do Devops"
$url = "https://graph.microsoft.com/v1.0/groups"

$json=  @"
{
    "description": "$description",
    "displayName": "$displayName",
    "groupTypes": [
    ],
    "mailEnabled": false,
    "mailNickname": "devops",
    "securityEnabled": true,
    "owners@odata.bind": [
      "https://graph.microsoft.com/v1.0/users/56c9a007-1547-47e7-9a82-89e66c3d3e72"
    ],
    "members@odata.bind": [
      "https://graph.microsoft.com/v1.0/users/bc66beb3-6475-4432-94af-9dcd56049ca2",
      "https://graph.microsoft.com/v1.0/users/b3dbc281-63c3-4105-9bdc-9bdeb4e1ce8e"
    ]
  }
"@


Invoke-MgGraphRequest -Uri $url -Method Post -Body $json
