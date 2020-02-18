package vn.nlu.fit.models;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Timestamp;
import java.text.NumberFormat;
import java.util.Date;
import java.util.Locale;

public class Testt {
    public static void main( String[] args ) throws MalformedURLException {
//        // make a test url
//        URL url = new URL( "http://stackoverflow.com/questions/10159186/how-to-get-parent-url-in-java" );
//
//        // represent the path portion of the URL as a file
//        File file = new File( url.getPath() );
//
//        // get the parent of the file
//        String parentPath = file.getParent( );
//
//        // construct a new url with the parent path
//        URL parentUrl = new URL( url.getProtocol( ), url.getHost( ), url.getPort( ), parentPath );
//
//        System.out.println( "Child: " + url );
//        System.out.println( "Parent: " + parentUrl.getPath() );
        System.out.println( new Timestamp(new Date().getTime()).toString());;
    }
}
