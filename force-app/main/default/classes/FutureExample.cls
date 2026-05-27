public class FutureExample {

    // Future method for Mixed DML
    @future
    public static void updateUser(Id userId) {
        User u = [SELECT Id, Title FROM User WHERE Id = :userId LIMIT 1];
        u.Title = 'Salesforce Developer Pro';
        update u;

        Account acc = new Account(Name = 'Future Test Account');
        insert acc;
    }

    // Future method for Callouts
    @future(callout=true)
    public static void makeCallout(String endpointUrl) {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpointUrl);
        req.setMethod('GET');
        HttpResponse res = http.send(req);

        System.debug('Response Status: ' + res.getStatusCode());
        System.debug('Response Body: ' + res.getBody());
    }
}