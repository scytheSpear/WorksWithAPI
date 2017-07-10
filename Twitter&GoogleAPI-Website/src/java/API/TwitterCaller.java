/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import entity.Twitter;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.basic.DefaultOAuthConsumer;
import org.netbeans.saas.RestConnection;
import org.netbeans.saas.RestResponse;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;
 
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;

/**
 *
 * @author user
 */
public class TwitterCaller {
    public static final String CONSUMER_KEY = "4l2q4Uzr3clTPJ6e3AHbw";
    public static final String CONSUMER_SECRET = "C8xITO80mGfgjbCsW1tEbziOp1bReojWJOU6gHgUgQ";
    public static final String OAUTH_TOKEN = "133678185-IatTCOfzE0MbSxX4QFG7RkqXyxhc0bxWHjVqhAEe";
    public static final String OAUTH_TOKEN_SECRET = "ONprFqB75HIhrHfSO4107RoMC7K4amPDJTm4YoHVKh46q";
    
    public List<Twitter> TwitterResponse(String qu) throws Exception{
        OAuthConsumer consumer = new DefaultOAuthConsumer(CONSUMER_KEY,CONSUMER_SECRET);
        consumer.setTokenWithSecret(OAUTH_TOKEN, OAUTH_TOKEN_SECRET);
        String query= qu;
        query = query.replaceAll(" ", "%20");
        String URL="https://api.twitter.com/1.1/search/tweets.json?q=" + query + "&count=30&lang=en";
        
        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{};
        RestConnection conn = new RestConnection(consumer.sign(URL), pathParams, queryParams);
        RestResponse response = conn.get();
        String tweetsString = response.getDataAsString();
        
        JSONObject tweetsJSONObject = new JSONObject(tweetsString);
            JSONArray twitterJsonArry = tweetsJSONObject.getJSONArray("statuses");
        
        
        Gson gson = new Gson();
        Type TwitterListType = new TypeToken<Collection<Twitter>>() {}.getType();
        List<Twitter> tweets = gson.fromJson(twitterJsonArry.toString(), TwitterListType);
        return tweets;
    
    }
    
   
}
