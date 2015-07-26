/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Functions;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author john
 */
public class UploadFileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String houseId ="";
        String owner = (String) request.getSession().getAttribute("username");
        String url="/errorPage.jsp";
        String message="fgd";
        //System.out.println("houseId= "+houseId);
        //System.out.println("owner= "+owner);
        response.setContentType("text/html");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            ServletFileUpload upload = new ServletFileUpload();
            try {
                FileItemIterator itr = upload.getItemIterator(request);
                while (itr.hasNext()) {
                    FileItemStream item = itr.next();
                    if (item.isFormField()) {
                        //do something
                        String fieldName = item.getFieldName();
                        InputStream is = item.openStream();
                        byte b[]= new byte[is.available()];
                        is.read(b);
                        String value = new String(b);
                        if("houseIddd".equals(fieldName)){
                            houseId = value;
                        }
                        response.getWriter().println(fieldName+":"+value+"<br/>");
                    } else {
                        System.out.println("MPHKE STO ELSE GIA NA BALEI SPITIA");
                        //upload file
                        String path = getServletContext().getRealPath("/");
                        //String path = getServletContext().getContextPath()+"/";

                        if (FileUpload.processFile(path, item,houseId,owner)) {
                            System.out.println("MPHKE STO processfile!");
                            //response.getWriter().println("file uploaded successfully");
                            message="file uploaded successfully";
                            
                            url = "/Estateprofile.jsp?houseId="+houseId+"&houseOwner="+owner+"&message="+message;
                            
                        } else {
                            message="file uploading failed";
                            url = "/Estateprofile.jsp?houseId="+houseId+"&houseOwner="+owner+"&message="+message;
                            
                            //response.getWriter().println("file uploading failed");
                        }
                    }
                }
            }catch (FileUploadException ex) {
                ex.printStackTrace();
                //Logger.getLogger(UploadFileServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            RequestDispatcher dispatcher
                = getServletContext().getRequestDispatcher(url);
        dispatcher.forward(request, response);
        }
    }

}
