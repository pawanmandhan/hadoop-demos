//import org.apache.hadoop.io.Text;
import org.json.*;
import java.util.*;
//import org.apache.hadoop.hive.ql.exec.UDF;

public class JSONObjector { //extends UDF {

    public static String TEST_STRING ="{\"ItemGroupData\": { \"ItemData\": [ { \"ItemOID\": \"DM.STUDYID\", \"Value\": \"CDISCPILOT01\" }, { \"ItemOID\": \"DM.DOMAIN\", \"Value\": \"DM\" }, { \"ItemOID\": \"DM.USUBJID\", \"Value\": \"01-701-1015\" }, { \"ItemOID\": \"DM.SUBJID\", \"Value\": 1015 }, { \"ItemOID\": \"DM.RFSTDTC\", \"Value\": \"2014-01-02\" }, { \"ItemOID\": \"DM.RFENDTC\", \"Value\": \"2014-07-02\" }, { \"ItemOID\": \"DM.RFXSTDTC\", \"Value\": \"2014-01-02\" }, { \"ItemOID\": \"DM.RFXENDTC\", \"Value\": \"2014-07-02\" }, { \"ItemOID\": \"DM.RFPENDTC\", \"Value\": \"2014-07-02T11:45\" }, { \"ItemOID\": \"DM.SITEID\", \"Value\": 701 }, { \"ItemOID\": \"DM.AGE\", \"Value\": 63 }, { \"ItemOID\": \"DM.AGEU\", \"Value\": \"YEARS\" }, { \"ItemOID\": \"DM.SEX\", \"Value\": \"F\" }, { \"ItemOID\": \"DM.RACE\", \"Value\": \"WHITE\" }, { \"ItemOID\": \"DM.ETHNIC\", \"Value\": \"HISPANIC OR LATINO\" }, { \"ItemOID\": \"DM.ARMCD\", \"Value\": \"Pbo\" }, { \"ItemOID\": \"DM.ARM\", \"Value\": \"Placebo\" }, { \"ItemOID\": \"DM.ACTARMCD\", \"Value\": \"Pbo\" }, { \"ItemOID\": \"DM.ACTARM\", \"Value\": \"Placebo\" }, { \"ItemOID\": \"DM.COUNTRY\", \"Value\": \"USA\" }, { \"ItemOID\": \"DM.DMDTC\", \"Value\": \"2013-12-26\" }, { \"ItemOID\": \"DM.DMDY\", \"Value\": -7 }, { \"ItemOID\": \"DM.COMPLT16\", \"Value\": \"Y\" }, { \"ItemOID\": \"DM.COMPLT24\", \"Value\": \"Y\" }, { \"ItemOID\": \"DM.COMPLT8\", \"Value\": \"Y\" }, { \"ItemOID\": \"DM.EFFICACY\", \"Value\": \"Y\" }, { \"ItemOID\": \"DM.ITT\", \"Value\": \"Y\" }, { \"ItemOID\": \"DM.SAFETY\", \"Value\": \"Y\" } ], \"ItemGroupOID\": \"DM\", \"data:ItemGroupDataSeq\": 1 }}";

    //public Text evaluate(final Text s) {
    public static void main(String arg[]) {
        try {
			//JSONObject jsonInArrFormat = new JSONObject(s.toString());
			JSONObject jsonInArrFormat = new JSONObject(TEST_STRING);
			JSONObject jsonRootObject = jsonInArrFormat.getJSONObject("ItemGroupData");
			JSONArray ja = jsonRootObject.getJSONArray("ItemData");
			
			JSONObject tmpArrayJSONElement = null;
			HashMap objectMap = new HashMap();
			for(int index=0;index<ja.length();index++){
				tmpArrayJSONElement = ja.getJSONObject(index);
				//System.out.println(tmpArrayJSONElement);
				objectMap.put(tmpArrayJSONElement.getString("ItemOID"),tmpArrayJSONElement.get("Value"));
			}

			JSONObject newInnerObj = new JSONObject(objectMap);
			newInnerObj.put("ItemGroupOID",jsonRootObject.getString("ItemGroupOID"));
			newInnerObj.put("data:ItemGroupDataSeq",jsonRootObject.get("data:ItemGroupDataSeq"));
			
			//getJSONArray(java.lang.String key) 
			//getJSONObject(java.lang.String key) 
			//JSONObject	toJSONObject(JSONArray names) 
			//JSONObject jsonObject = new JSONObject();
			//return new Text(jsonPrettyPrintString);
			
//			System.out.println(TEST_STRING);
			System.out.println(newInnerObj);
        } catch (Exception je) {
            //return new Text("Error while converting XML to JSON");
            je.printStackTrace();
        }
    }
}