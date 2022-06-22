@isTest
public class VerifyDateTest {
	@isTest static void testCheckDatesDateWithin30Days() {
        Date firstDate = System.today();
        Date secondDate = System.today().addDays(10);
        Date returnDate = VerifyDate.CheckDates(firstDate, secondDate);
    }
    @isTest static void testCheckDatesSetEndOfMonthDate() {
        Date firstDate = System.today();
        Date secondDate = System.today().addDays(40);
        Date returnDate = VerifyDate.CheckDates(firstDate, secondDate);
    }
}