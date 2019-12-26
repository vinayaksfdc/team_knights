public class Rest_Wrap_acc {
    
    public class jsonWrapper {
        public String clientId {get; set;}
        public String clientSecret {get; set;}
        public String username{set;get;}
        public String password{set;get;}
    }
    
    
    public String access_token{set;get;}
    public String result{set;get;}
    public String endpoint{set;get;}
    public List<account> accs{set;get;}
    public Rest_Wrap_acc()
    {
        endpoint='https://login.salesforce.com/services/oauth2/token';
    }
    //  public void send(String clientid, String clientsecret, String username, String password)
    public void send()
    {
        jsonWrapper wrap = new jsonWrapper();
        wrap.clientId='3MVG9G9pzCUSkzZu1zTdt.8OyCfofKs87S0aYUhr1g4AxZI0iGb6Is2SFXVPOSuBvfMpK92sRE9HlBHkyrjJp';
        wrap.clientSecret='858A4A1794912759AE344C4F056157819C10E9B4BD3E4A59082F8DC06757411A';    
        wrap.username='altok1@gmail.com';
        wrap.password='Jerry@123';
        String jsonBody = json.serialize(wrap);
        HttpResponse res;
        HttpRequest req = new HttpRequest();
        req.setEndPoint('https://login.salesforce.com/services/oauth2/token'); 
        req.setMethod('POST');
        req.setHeader('Content-Type','application/json');
        req.setBody(jsonBody);
        Http http_req = new Http();
        res = http_req.send(req);
        System.Debug(res.toString());
        
        system.debug('response  is'+result);
        System.JSONParser jp=Json.createParser(result);
        while(jp.nextToken()!=null){
            if(jp.getText()=='access_token')
            {
                jp.nextToken();
                access_token=jp.getText();
            }
        }
    }
    
    public void invoke(){
        String endPoint = 'https://vnykbule-dev-ed.my.salesforce.com/services/apexrest/v1/getAccounts/';
        Http h2 = new Http();
        HttpRequest req1 = new HttpRequest();
        req1.setHeader('Authorization','OAuth ' + access_Token);
        req1.setMethod('GET');
        req1.setEndpoint(endPoint);
        HttpResponse res1 = h2.send(req1);
        result=res1.getBody();
        list<account> ListAccount=new List<account>();
        System.debug(' response is@@@RESPONSE@@'+res1.getBody());
        String trimmedResponse = res1.getBody().unescapeCsv().remove('\\');
        system.debug('trimmed response is@@@RESPONSE@@'+trimmedResponse);
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
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                        (parser.getText() == 'phone')) {
                            parser.nextToken();
                            string sphone= parser.getText();
                            acc.phone=sphone;
                            system.debug('Phone@@@' + sPhone );
                        }
                    parser.nextToken();
                    if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                        (parser.getText() == 'Name')) {
                            parser.nextToken();
                            string sindustry= parser.getText();
                            acc.industry=sindustry;
                            system.debug('industry@@@' + sindustry );
                        }
                }
                accList.add(acc);
            }
            accList.remove(null);
        }
        ListAccount.AddAll(accList);
        system.debug('AccountList@@@@'+Json.serialize(ListAccount));
        
    }
    
}