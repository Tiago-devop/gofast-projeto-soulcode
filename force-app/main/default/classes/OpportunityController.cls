public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getListOpportunitiesClosed() {
        return [SELECT name, Description, StageName FROM Opportunity WHERE StageName = 'Closed Lost' LIMIT 10];
    }
}