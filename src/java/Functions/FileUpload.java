/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Functions;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import org.apache.commons.fileupload.FileItemStream;

/**
 *
 * @author john
 */
public class FileUpload {

    public static boolean processFile(String path, FileItemStream item, String houseId, String owner) {
        if("".equals(item.getName())){
            return false;
        }
        String nm = houseId + item.getName();
        System.out.println("nm ====================="+nm);
        try {
            File f = new File(path + File.separator + "images/");

            if (!f.exists()) {//den uparxei kan o fakelos opote den einai sthn database tpt!
                System.out.println("Mphke sthn if den exists");
                f.mkdir();
                File savedFile = new File(f.getAbsoluteFile() + File.separator + nm);
                FileOutputStream fos = new FileOutputStream(savedFile);
                InputStream is = item.openStream();
                int x = -1;
                byte b[] = new byte[1024];
                while ((x = is.read(b)) != -1) {
                    fos.write(b, 0, x);
                    //fos.write(x);
                }
                fos.flush();
                fos.close();
                database_common_functions.insertIntoBaseImage(houseId, nm);

                return true;
            } else {
                System.out.println("Mphke sthn if exists");
                if (database_common_functions.isHouseImageInDatabase(houseId, nm) == 1) {
                    //overwrites current image with name nm.
                    System.out.println("Mphke na kanei overwrite t arxeio");
                    FileOutputStream fos = new FileOutputStream(f.getAbsoluteFile() + File.separator + nm);
                    InputStream is = item.openStream();
                    int x = -1;
                    byte b[] = new byte[1024];
                    while ((x = is.read(b)) != -1) {
                        fos.write(b, 0, x);
                        //fos.write(x);
                    }
                    fos.flush();
                    fos.close();
                    return true;
                } else {

                    FileOutputStream fos = new FileOutputStream(f.getAbsoluteFile() + File.separator + nm);
                    InputStream is = item.openStream();
                    int x = -1;
                    byte b[] = new byte[1024];
                    while ((x = is.read(b)) != -1) {
                        fos.write(b, 0, x);
                        //fos.write(x);
                    }
                    fos.flush();
                    fos.close();
                    database_common_functions.insertIntoBaseImage(houseId, nm);
                    return true;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
