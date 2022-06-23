public with sharing class ParkServiceMock implements WebServiceMock  {
    public void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
		List<String> returnList = new List<String>();
		returnList.add('{"Alemanha" : ["eats", "id", "trailhead", "says"]}');
		returnList.add('{"Japão" : ["eats", "id", "trailhead", "says"]}');
		response_x.return_x = returnList;
        // end
        response.put('response_x', response_x); 
   }
}
