public with sharing class LeadState {

    @AuraEnabled (cacheable=true)
    public static List<Lead> getListLeadState (){
        return [ SELECT Id, Name, State FROM Lead];
    }

    @AuraEnabled(cacheable=true)
    public static List<AggregateResult> getListTopTenLeadConverted() {
        return [SELECT state, count(id)  FROM Lead WHERE Status = 'Perdido' GROUP BY state ORDER BY count(id) DESC LIMIT 10];
    }
}