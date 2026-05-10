# terraform-pipeline
Remember created two credentials file in jenkins first for ACCESS_KEY and Second for SECRET_KEY
Manage Jenkins → Credentials → System → Global credentials → Add Credentials
```
🔑 CREATE ACCESS KEY (IMPORTANT)
Field	Value
Kind	Secret text
Secret	YOUR_ACCESS_KEY (From your AWS account downloaded in excel)
ID	aws-access-key-id (This name remain same as we are using this in Jenkinsfile)

🔑 CREATE SECRET KEY
Field	Value
Kind	Secret text
Secret	YOUR_SECRET_KEY (From your AWS account downloaded in excel)
ID	aws-secret-access-key (This name remain same as we are using this in Jenkinsfile)
```
