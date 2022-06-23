public class DailyLeadProcessor implements Schedulable {
    public void execute(SchedulableContext ctx) {
        List<Lead> result = new List<Lead>();
		for(Lead currentLead : [
			SELECT 	Id, 
					LeadSource
			FROM	Lead 
			WHERE	LeadSource = ''
			LIMIT 	200
		]){
			currentLead.LeadSource = 'Dreamforce';
			result.add(currentLead);
		}
		update(result);
    }
}