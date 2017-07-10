/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package TwitterAPI;

import org.netbeans.saas.RestConnection;
import org.netbeans.saas.RestResponse;

/**
 *
 * @author user
 */
public class GoogleSearch {
    
    public static void main(String[] args) throws Exception
{
    String API_key = "AIzaSyCO4vp-Ttx62V37ULoC0-i7ff8yYF-IgtQ";
    String SEARCH_ID_cx = "010909970291913928886:-hwnk9ralwm";
    
    String[][] pathParams = new String[][]{};
    String[][] queryParams = new String[][]{};
    String query="The 2014 ACM International Joint";
    RestConnection conn = new RestConnection("https://www.googleapis.com/customsearch/v1?key="+API_key+ "&cx="+
    SEARCH_ID_cx + "&q="+ query + "&num=5", pathParams, queryParams);
    RestResponse response = conn.get();
    System.out.println("Response ="+response.getDataAsString());
}
}
