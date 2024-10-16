<%@ page import="java.sql.*" %>
<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "");

        // Assuming you're iterating through multiple requests in the form
        String sql = "SELECT subject FROM faculty WHERE is_approved = 0";
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        while (rs.next()) {
            String subject = rs.getString("subject");
            String decision = request.getParameter("decision_" + subject); // Retrieve the radio button value

            if (decision != null) {
                if (decision.startsWith("accept")) {
                    // Approve the request in the database
                    String updateSql = "UPDATE faculty SET is_approved = 1 WHERE subject = ?";
                    PreparedStatement pstmt = con.prepareStatement(updateSql);
                    pstmt.setString(1, subject);
                    pstmt.executeUpdate();
                    pstmt.close();
                } else if (decision.startsWith("decline")) {
                    // Optionally delete or mark as declined
                    String deleteSql = "DELETE FROM faculty WHERE subject = ?";
                    PreparedStatement pstmt = con.prepareStatement(deleteSql);
                    pstmt.setString(1, subject);
                    pstmt.executeUpdate();
                    pstmt.close();
                }
            }
        }

        rs.close();
        stmt.close();
        con.close();

        // Redirect or display success message
        out.println("Faculty requests processed successfully.");
    } catch (Exception e) {
        out.println("Error: " + e);
    }
%>
