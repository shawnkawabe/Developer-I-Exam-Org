public with sharing class ParkLocator {
    public static List<String> country (String currentCountry) {
		ParkService.ParksImplPort parkService = new ParkService.ParksImplPort();
		List<String> result = parkService.byCountry(currentCountry);
		System.debug(result);
		return result;
    }
}
