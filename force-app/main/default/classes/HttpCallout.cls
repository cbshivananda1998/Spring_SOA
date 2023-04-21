public with sharing class HttpCallout {
    public static void getData() {
        String endpoint = 'https://postman-echo.com/get?foo1=bar1&foo2=bar2';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        System.debug(res.getBody()); 
    }
}