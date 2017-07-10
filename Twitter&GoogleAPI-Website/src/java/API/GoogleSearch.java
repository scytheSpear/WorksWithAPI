/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import entity.Google;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.netbeans.saas.RestConnection;
import org.netbeans.saas.RestResponse;

/**
 *
 * @author user
 */
public class GoogleSearch {

    public List<Google> search(String data) throws Exception {

        String API_key = "AIzaSyCO4vp-Ttx62V37ULoC0-i7ff8yYF-IgtQ";
        String SEARCH_ID_cx = "010909970291913928886:-hwnk9ralwm";

        String[][] pathParams = new String[][]{};
        String[][] queryParams = new String[][]{};
        String query = data;
        RestConnection conn = new RestConnection("https://www.googleapis.com/customsearch/v1?key=" + API_key + "&cx="
                + SEARCH_ID_cx + "&q=" + query + "&num=10", pathParams, queryParams);
        RestResponse response = conn.get();
        String googleString = response.getDataAsString();

        JSONObject gresultJSONObject = new JSONObject(googleString);
        JSONArray gresultJsonArry = gresultJSONObject.getJSONArray("items");

        Gson gson = new Gson();
        Type GoogleListType = new TypeToken<Collection<Google>>() {}.getType();
        List<Google> gresult = gson.fromJson(gresultJsonArry.toString(), GoogleListType);

        
        return gresult;
    }
}
