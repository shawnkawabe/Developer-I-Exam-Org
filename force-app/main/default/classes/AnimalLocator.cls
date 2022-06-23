public with sharing class AnimalLocator {
    public static String getAnimalNameById(Integer id) {
		String result = '';
		Http http = new Http();
		HttpRequest request = new HttpRequest();
		request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
		request.setMethod('GET');
		HttpResponse response = http.send(request);
		Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
		Map<String, Object> animals = (Map<String, Object>) results.get('animal');

		result = String.valueOf(animals.get('name'));
		return result;
    }
}