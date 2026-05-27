EDMO Enrollment Intelligence Integration (Salesforce)

This project implements a Salesforce-side integration for receiving and processing Enrollment Readiness Scores from the EDMO AI platform.

Key Features:
- Apex REST API to accept bulk enrollment scores from external systems
- Contact matching using email with partial success/failure handling
- Trigger handler to update Contact Enrollment Priority (Hot/Warm/Cold) based on latest score
- Bulk-safe trigger logic ensuring latest Scored_At__c wins in multi-record inserts
- Lightning Web Component to display the most recent enrollment score on Contact record page
- Apex controller with security enforcement (FLS using WITH SECURITY_ENFORCED)
- Comprehensive test class covering REST API, trigger logic, and bulk scenarios

Design Approach:
Layered architecture (REST → Service → Trigger Handler → UI Controller) to ensure separation of concerns, scalability, and maintainability. All DML and SOQL operations are bulkified and optimized for governor limits.
