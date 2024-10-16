import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class UploadStudyMaterialServle extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the file input from the form
        Part filePart = request.getPart("file"); 
        String fileName = getFileName(filePart);  // Use custom method to get file name
        InputStream fileContent = filePart.getInputStream();

        // JDBC connection
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root",""); // Update password if necessary
            
            // Prepare SQL statement for inserting the file data
            String sql = "INSERT INTO study_materials (file_name, file_data) VALUES (?, ?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, fileName);
            statement.setBlob(2, fileContent);
            
            // Execute the update
            int row = statement.executeUpdate();
            if (row > 0) {
                response.getWriter().println("File uploaded successfully!");
            } else {
                response.getWriter().println("File upload failed.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error uploading file: " + e.getMessage());
        } finally {
            // Close resources to avoid memory leaks
            try {
                if (statement != null) statement.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        for (String token : contentDisposition.split(";")) {
            if (token.trim().startsWith("filename")) {
                // Extract the filename from the header
                return token.substring(token.indexOf('=') + 2, token.length() - 1).replace("\"", "");
            }
        }
        return null;
    }
}
