/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package client;


import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.List;
 
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import entity.Coreconf;

/**
 * Jersey REST client generated for REST resource:CoreconfFacadeREST
 * [entity.coreconf]<br>
 * USAGE:
 * <pre>
 *        CoREClient client = new CoREClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author user
 */
public class CoREClient {
    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/FIT5046A1/webresources";

    public CoREClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("entity.coreconf");
    }

      public <T> T findByAcronym_XML(Class<T> responseType, String acr) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("acronym/{0}", new Object[]{acr}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findByAcronym_JSON(Class<T> responseType, String acr) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("acronym/{0}", new Object[]{acr}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void remove(String id) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("{0}", new Object[]{id})).request().delete();
    }

    public <T> T findByRank_XML(Class<T> responseType, String ra) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("rank/{0}", new Object[]{ra}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findByRank_JSON(Class<T> responseType, String ra) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("rank/{0}", new Object[]{ra}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public String countREST() throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path("count");
        return resource.request(javax.ws.rs.core.MediaType.TEXT_PLAIN).get(String.class);
    }

    public <T> T findAll_XML(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findAll_JSON(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void edit_XML(Object requestEntity, String id) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("{0}", new Object[]{id})).request(javax.ws.rs.core.MediaType.APPLICATION_XML).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_XML));
    }

    public void edit_JSON(Object requestEntity, String id) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("{0}", new Object[]{id})).request(javax.ws.rs.core.MediaType.APPLICATION_JSON).put(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public <T> T findByConfTitle_XML(Class<T> responseType, String title) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("confTitle/{0}", new Object[]{title}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findByConfTitle_JSON(Class<T> responseType, String title) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("confTitle/{0}", new Object[]{title}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T findByForcode_XML(Class<T> responseType, String fc) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("forcode /{0}", new Object[]{fc}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findByForcode_JSON(Class<T> responseType, String fc) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("forcode /{0}", new Object[]{fc}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void create_XML(Object requestEntity) throws ClientErrorException {
        webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_XML).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_XML));
    }

    public void create_JSON(Object requestEntity) throws ClientErrorException {
        webTarget.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public <T> T findRange_XML(Class<T> responseType, String from, String to) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("{0}/{1}", new Object[]{from, to}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T findRange_JSON(Class<T> responseType, String from, String to) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("{0}/{1}", new Object[]{from, to}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public <T> T find_XML(Class<T> responseType, String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("{0}", new Object[]{id}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_XML).get(responseType);
    }

    public <T> T find_JSON(Class<T> responseType, String id) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("{0}", new Object[]{id}));
        return resource.request(javax.ws.rs.core.MediaType.APPLICATION_JSON).get(responseType);
    }

    public void close() {
        client.close();
    }
    
    public String getString(String id){
        String jsonResponse = find_JSON(String.class, id);
        return jsonResponse;
    }
    
    public Coreconf getCoreconf(String id){
        Gson gson = new Gson();
        Coreconf coreconf = gson.fromJson(getString(id), Coreconf.class);      
        return coreconf;
    }
    
    public String getAsString () {
        String jsonResponse= findAll_JSON(String.class);
        return jsonResponse;
    }
    
    public List<Coreconf> getList(){
        String json = getAsString();   
        Gson gson = new Gson();
        Type CoreconfListType = new TypeToken<Collection<Coreconf>>() {}.getType();
        List<Coreconf> coreconfs = gson.fromJson(json, CoreconfListType);
        return coreconfs;
    }
    
    public String getStringFromTitle(String title){
        String jsonResponse = findByConfTitle_JSON(String.class, title);
        return jsonResponse;
    }
       
    public List<Coreconf> getListFromTitle(String title){
           String json = getStringFromTitle(title);
           Gson gson = new Gson();
           Type CoreconfListType = new TypeToken<Collection<Coreconf>>() {}.getType();
           List<Coreconf> coreconfs = gson.fromJson(json, CoreconfListType);
           return coreconfs;
    }
     
    public String getStringFromAcronym(String acronym){
        String jsonResponse = findByAcronym_JSON(String.class, acronym);
        return jsonResponse;
    }
       
    public List<Coreconf> getListFromAcronym(String acronym){
           String json = getStringFromAcronym(acronym);
           Gson gson = new Gson();
           Type CoreconfListType = new TypeToken<Collection<Coreconf>>() {}.getType();
           List<Coreconf> coreconfs = gson.fromJson(json, CoreconfListType);
           return coreconfs;
    }
    
     public String getStringFromRank(String rank){
        String jsonResponse = findByRank_JSON(String.class, rank);
        return jsonResponse;
    }
       
    public List<Coreconf> getListFromRank(String rank){
           String json = getStringFromRank(rank);
           Gson gson = new Gson();
           Type CoreconfListType = new TypeToken<Collection<Coreconf>>() {}.getType();
           List<Coreconf> coreconfs = gson.fromJson(json, CoreconfListType);
           return coreconfs;
    }
    
    public String getStringFromForcode(String forcode){
        String jsonResponse = findByForcode_JSON(String.class, forcode);
        return jsonResponse;
    }
       
    public List<Coreconf> getListFromForcode(String forcode){
           String json = getStringFromForcode(forcode);
           Gson gson = new Gson();
           Type CoreconfListType = new TypeToken<Collection<Coreconf>>() {}.getType();
           List<Coreconf> coreconfs = gson.fromJson(json, CoreconfListType);
           return coreconfs;
    }
       
    public String check(Boolean ischecked){
        String c = "no";
        if (ischecked == true){
        c = "yes";  }
    
    return c;
    }
}
