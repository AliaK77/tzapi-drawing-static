/**
 * Loading JSON Data to retrieve JSON data via URL section of code originally by Daniel Shiffman.  
 * code modified by AliaK to create a drawing from tezos api data 20-21/03/2021
 * modified sketch from 2019 version to change to tezos api
 * note: the api chosen below uses JSONArray not JSONObject (original 2019 sketch uses JSONObject) due to different format JSON source
 * this is a static version - it gathers the api data once then saves a jpg file of the api drawing
 */


void setup() 
{
//       size (500, 350);
         size (800, 600);
// //  size(3000, 2000);
//  size(4000, 4000);
// //  size(1000, 1000);
  background(255);
  fill(100);


  String accountId = "KT1Hkg5qeNhfwpKW4fXvq7HGZB9z2EnmCCA9";  // hicetnunc_minter
  
  String tzapiParam = "operations";
    
  String dateTime = year() + "-" +month() + "-" +day() + "-" +hour() +minute();
  String fileName = "tzHash-" +dateTime + ".jpg";

  String url = "https://api.tzkt.io/v1/accounts/"+accountId+"/"+tzapiParam;
  
  JSONArray values;

  values = loadJSONArray(url);

  for (int i = 0; i < values.size(); i++) 
  {
    
    JSONObject tz = values.getJSONObject(i); 

    int tzamountInt = tz.getInt("amount");
    String tzamount = str(tzamountInt);
        
    String tztimestamp = tz.getString("timestamp");
    String tztype = tz.getString("type");
    String tzhash = tz.getString("hash");
    String tzblock = tz.getString("block");

    println(tzhash);  

    textSize(10);
    text(tzamount,random(2000),random(300),2000+random(800),2000+random(600));
//    fill(tzamountInt+random(20));
    textSize(20);
    text(tztimestamp,5+random(2000),50+random(300),2500+random(2000),3000+random(2000));
//    fill(tzamountInt+random(10));
    textSize(14);
    text(tztype,7+random(2000),70+random(300),2000+random(2000),2000+random(1000));
    fill(tzamountInt+random(30));
    textSize(tzamountInt+random(10));
    text(tzhash,5+random(2000),10+random(300),100+random(780),1500+random(650));
    fill(tzamountInt+random(25));
    textSize(50);
    text(tzblock,30+random(2000),70+random(300),10+random(700),20+random(8000));


  } // end for

      save(fileName);

} // end setup
