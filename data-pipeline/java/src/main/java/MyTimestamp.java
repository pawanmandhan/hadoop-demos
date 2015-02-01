import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by bsaini on 2/1/15.
 */
public class MyTimestamp {

    public static String customTimestamp(String format){

        String date="";
        try {
            if(format==null||format.trim().length()==0)
                format = "dd/M/yyyy";

            SimpleDateFormat sdf = new SimpleDateFormat(format);
            date = sdf.format(new Date());
        }catch(Exception e){
            date="";
        }
        return date;
    }

    public static String getCurrentDate_YYYYMMDD(){
        return customTimestamp("YYYYMMDD");
    }

    public static void main(String a[]){
        System.out.println(customTimestamp("YYYYMMDD"));
    }

}
