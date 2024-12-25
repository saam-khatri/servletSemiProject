package helpers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.Part;

import java.io.*;

import jakarta.servlet.http.HttpServletRequest;

public class FileUpload <F>{

    F file = null;
    public FileUpload(F file){
        this.file = file;
    }

    public class GetFilePath extends HttpServlet {
        String path = null;

        public GetFilePath(String path){
            this.path = path;
        }

        public String getPart(HttpServletRequest request) throws IOException, ServletException {
            String x = null;
            Part part = request.getPart((String) file);
            String fileName = part.getSubmittedFileName();
            String path = (String) this.path + File.separator+fileName;
            x = fileName;
            InputStream inputStream = part.getInputStream();
            uploadFile(inputStream, path);

            return x;
        }
    }
    public boolean uploadFile(InputStream inputStream, String path) {
        boolean result = false;
        try {
            byte[] buffer = new byte[inputStream.available()];
            inputStream.read(buffer);

            FileOutputStream fileOutputStream = new FileOutputStream(new File(path));
            fileOutputStream.write(buffer);
            fileOutputStream.close();
            result = true;

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return result;

    }






}
