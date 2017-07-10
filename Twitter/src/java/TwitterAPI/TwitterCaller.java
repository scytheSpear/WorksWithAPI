/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package TwitterAPI;

import oauth.signpost.OAuthConsumer;
import oauth.signpost.basic.DefaultOAuthConsumer;
import org.netbeans.saas.RestConnection;
import org.netbeans.saas.RestResponse;

/**
 *
 * @author user
 */
public class TwitterCaller {
    public static final String CONSUMER_KEY = "4l2q4Uzr3clTPJ6e3AHbw";
    public static final String CONSUMER_SECRET = "C8xITO80mGfgjbCsW1tEbziOp1bReojWJOU6gHgUgQ";
    public static final String OAUTH_TOKEN = "133678185-IatTCOfzE0MbSxX4QFG7RkqXyxhc0bxWHjVqhAEe";
    public static final String OAUTH_TOKEN_SECRET = "ONprFqB75HIhrHfSO4107RoMC7K4amPDJTm4YoHVKh46q";
    
    
    public static void main(String[] args) throws Exception {
        OAuthConsumer consumer = new DefaultOAuthConsumer(CONSUMER_KEY,CONSUMER_SECRET);
        consumer.setTokenWithSecret(OAUTH_TOKEN, OAUTH_TOKEN_SECRET);
        String query="Monash University";
        query = query.replaceAll(" ", "%20");
        String URL="https://api.twitter.com/1.1/search/tweets.json?q=" + query;
        System.out.println("--->" + consumer.sign(URL));
        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{};
        RestConnection conn = new RestConnection(consumer.sign(URL), pathParams, queryParams);
        RestResponse response = conn.get();
        System.out.println("Response =" + response.getDataAsString());
    }
    
    public String TwitterResponse() throws Exception{
        OAuthConsumer consumer = new DefaultOAuthConsumer(CONSUMER_KEY,CONSUMER_SECRET);
        consumer.setTokenWithSecret(OAUTH_TOKEN, OAUTH_TOKEN_SECRET);
        String query="Monash University";
        query = query.replaceAll(" ", "%20");
        String URL="https://api.twitter.com/1.1/search/tweets.json?q=" + query;
        
        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{};
        RestConnection conn = new RestConnection(consumer.sign(URL), pathParams, queryParams);
        RestResponse response = conn.get();
        
        
        return response.getDataAsString();
    
    }
}
