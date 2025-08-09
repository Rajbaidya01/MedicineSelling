package myPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        String uid = request.getParameter("id");
        String pass = request.getParameter("pw");
        if("admin".equals(uid)  && "admin".equals(pass)) {
        	response.sendRedirect("adminPanel.jsp");
        }
        int isValid=Validation.checkUser(uid, pass);
        String userName="";
        if(isValid==2)
        {
        	try {
				userName=getUserName(uid);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
        	HttpSession session = request.getSession();
        	session.setAttribute("user", userName);
        	response.sendRedirect("web.jsp");
        }
        else if(isValid==1) {
        	
        	try {
				userName+=getUserName(uid);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
        	request.setAttribute("uname", userName);
        	RequestDispatcher rs = request.getRequestDispatcher("/WrongPass");
        	rs.forward(request, response);
        }
        else if(isValid==0)
        {
        	response.setContentType("text/html");
        	PrintWriter out = response.getWriter();

        	out.println("<!DOCTYPE html>");
        	out.println("<html lang='en'>");
        	out.println("<head>");
        	out.println("<meta charset='UTF-8'>");
        	out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
        	out.println("<title>User Not Found</title>");
        	out.println("<style>");
        	out.println("body {"
        	        + "font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
        	        + "background-color: #e8f5e9;"
        	        + "display: flex;"
        	        + "justify-content: center;"
        	        + "align-items: center;"
        	        + "height: 100vh;"
        	        + "margin: 0;"
        	        + "}");
        	out.println(".error-card {"
        	        + "background-color: #fff;"
        	        + "padding: 40px;"
        	        + "border-radius: 14px;"
        	        + "box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);"
        	        + "max-width: 450px;"
        	        + "text-align: center;"
        	        + "color: #d32f2f;"
        	        + "font-size: 20px;"
        	        + "}");
        	out.println(".btn {"
        	        + "background-color: #2e7d32;"
        	        + "color: #ffffff;"
        	        + "padding: 12px 25px;"
        	        + "font-size: 16px;"
        	        + "border: none;"
        	        + "border-radius: 8px;"
        	        + "cursor: pointer;"
        	        + "text-decoration: none;"
        	        + "display: inline-block;"
        	        + "margin-top: 25px;"
        	        + "transition: background-color 0.3s ease, transform 0.2s ease;"
        	        + "}");
        	out.println(".btn:hover {"
        	        + "background-color: #388e3c;"
        	        + "transform: scale(1.02);"
        	        + "}");
        	out.println("</style>");
        	out.println("</head>");
        	out.println("<body>");

        	out.println("<div class='error-card'>");
        	out.println("User ID doesn't Exist");
        	out.println("<br>");
        	out.println("<a class='btn' href='signup.html'>Click To Signup</a>");
        	out.println("</div>");

        	out.println("</body>");
        	out.println("</html>");

        }
    }  
	public static String getUserName(String uid) throws SQLException, ClassNotFoundException {
		String name="";
		Connection con=CreateConnection.myConnection();
		
		PreparedStatement ps = con.prepareStatement("select * from customer where id=?");
		ps.setString(1, uid);
        ResultSet rs =ps.executeQuery();
        if(rs.next())
        	name=rs.getString("name");
        return name;
	}
}

