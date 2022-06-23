@isTest
private class DailyLeadProcessorTest {
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 25 19 22 6 ? 2022';
    static testmethod void testScheduledJob() {
        // Create some out of date Lead records
        List<Lead> leadList = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            Lead leadTest = new Lead(LastName='Test'+ i,Company='Test'+ i,LeadSource='');
            leadList.add(leadTest);
        }
        insert(leadList);
		// Get the IDs of the opportunities we just inserted
        Map<Id, Lead> leadMap = new Map<Id, Lead>(leadList);
        List<Id> leadIds = new List<Id>(leadMap.keySet());
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',
            CRON_EXP,
            new DailyLeadProcessor());
        // Verify the scheduled job has not run yet.
        List<Lead> lt = [
			SELECT 	Id, 
					LeadSource
            FROM 	Lead
            WHERE 	LeadSource = 'Dreamforce'];
        System.assertEquals(0, lt.size(), 'Lead exist before job has run');
        // Stopping the test will run the job synchronously
        Test.stopTest();
        // Now that the scheduled job has executed,
        // check that our tasks were created
        List<Lead> afterlt = [
			SELECT 	Id, 
					LeadSource
            FROM 	Lead
            WHERE 	LeadSource = 'Dreamforce'];
        System.assertEquals(200,
			afterlt.size(),
            'Lead were not updated');
    }
}