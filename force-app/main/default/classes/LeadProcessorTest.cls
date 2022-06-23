@IsTest
public class LeadProcessorTest {
    @testSetup
    public static void setupData(){
        List<Lead> leadList = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
            Lead leadTest = new Lead(LastName='Test'+ i,Company='Test'+ i,LeadSource='Web');
            leadList.add(leadTest);
        }
        insert(leadList);
        LeadProcessor leadProcessor = new LeadProcessor();
    }

    @IsTest
    public static void testAccountProcessor() {
        Test.startTest();
            LeadProcessor leadProcessor = new LeadProcessor();
            Id batchId = Database.executeBatch(leadProcessor);
        Test.stopTest();
        
        System.assertEquals(200, [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce'] , 'The count its wrong in id >> ' + [SELECT count() FROM Lead WHERE LeadSource = 'Dreamforce']);
      }
}