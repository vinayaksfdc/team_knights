public class GetAccountUsingRESTAPI {
    
    private final String clientId = '3MVG9G9pzCUSkzZu1zTdt.8OyCfofKs87S0aYUhr1g4AxZI0iGb6Is2SFXVPOSuBvfMpK92sRE9HlBHkyrjJp';
    private final String clientSecret = '858A4A1794912759AE344C4F056157819C10E9B4BD3E4A59082F8DC06757411A';
    private final String username = 'altok1@gmail.com';
    private final String password = 'Test@123';
    public class deserializeResponse
    {
        public String id;
        public String access_token;
    }
    public String ReturnAccessToken (GetAccountUsingRESTAPI acount)
    {
        String reqbody = 'grant_type=password&amp;client_id='
            +clientId+'&amp;client_secret='
            +clientSecret+'&amp;username='
            +username+'&amp;password='+password;
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setBody(reqbody);
        req.setMethod('POST');
        req.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res = h.send(req);
        deserializeResponse response = (deserializeResponse)JSON.deserialize(res.getbody(),deserializeResponse.class);
        system.debug('@@@@access_token@@'+response );
        return response.access_token;
    }
    public static list<account> callGetAccount()
    {
        GetAccountUsingRESTAPI acount1 = new GetAccountUsingRESTAPI();
        String accessToken;
        accessToken = acount1.ReturnAccessToken (acount1);
        list<account> ListAccount=new List<account>();
        if(accessToken != null){
            String endPoint = 'https://vnykbule-dev-ed.my.salesforce.com/services/apexrest/v1/getAccounts/';
            Http h2 = new Http();
            HttpRequest req1 = new HttpRequest();
            req1.setHeader('Authorization','Bearer ' + accessToken);
            req1.setHeader('Content-Type','application/json');
            req1.setHeader('accept','application/json');
            req1.setMethod('GET');
            req1.setEndpoint(endPoint);
            HttpResponse res1 = h2.send(req1);
            String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
            system.debug('@@@RESPONSE@@'+trimmedResponse);
            JSONParser parser = JSON.createParser(res1.getBody());
            set<account> accList=new set<account>(); 
            
            while (parser.nextToken() != null) {
                
                if((parser.getCurrentToken() == JSONToken.FIELD_NAME) ){
                    Account acc;
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) && (parser.getText() == 'Id')) {
                       parser.nextToken();
                        String sId= parser.getText();
                        acc=new Account();
                        acc.Id=sId;
                        system.debug('Id@@@' + sId);
                        
                        parser.nextToken();
                        if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                            (parser.getText() == 'Name')) {
                                parser.nextToken();
                                string sName= parser.getText();
                                acc.Name=sName;
                                system.debug('Name@@@' + sName );
                            }
                    }
                    accList.add(acc);
                }
                accList.remove(null);
            }
            ListAccount.AddAll(accList);
            system.debug('AccountList@@@@'+Json.serialize(ListAccount));
        }
        return ListAccount;
    }  
}