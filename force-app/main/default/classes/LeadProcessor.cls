public with sharing class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, LeadSource FROM Lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> updatedLeads = new List<Lead>();
        for (Lead currentLead : scope) {
            currentLead.LeadSource = 'Dreamforce';
            recordsProcessed = recordsProcessed + 1;
            updatedLeads.add(currentLead);
        }
        update updatedLeads;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
       
    }
}
