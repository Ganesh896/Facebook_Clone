
package com.tech.blog.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Dell
 */
public class Helper {
    public static boolean deleteFile(String path) {
        boolean flag = false;
        
        try {
            File file = new File(path);
            flag = file.delete();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
    
    public static boolean saveFile(InputStream is, String path) {
        boolean flag = false;
        
        try {
            byte b[] = new byte[is.available()];
            
//            reading data from is(inpuStrem) and store in byte array b
            is.read(b);
            
//            writing data to path
            FileOutputStream fos = new FileOutputStream(path);
            fos.write(b);
            
            fos.flush();
            fos.close();
            
            flag = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return flag;
    }
}
