package myPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Connection con=CreateConnection.myConnection();
			String uid=request.getParameter("id");
			String pass=request.getParameter("pw");
			String uname=request.getParameter("nm");
			String query="insert into customer values(?,?,?)";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, uname);
			ps.setString(2, uid);
			ps.setString(3, pass);
			int b=ps.executeUpdate();
			if(b==1) {
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();

				out.println("<!DOCTYPE html>");
				out.println("<html lang='en'>");
				out.println("<head>");
				out.println("<meta charset='UTF-8'>");
				out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
				out.println("<title>Signup Success</title>");
				out.println("<link rel='stylesheet' href='your-css-file.css'>"); // Optional: Link external CSS
				out.println("<style>");
				out.println("body {"
				        + "font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;"
				        + "background-color: #e8f5e9;"
				        + "color: #1b1b1b;"
				        + "display: flex;"
				        + "justify-content: center;"
				        + "align-items: center;"
				        + "height: 100vh;"
				        + "margin: 0;"
				        + "}");
				out.println(".signup-card {"
				        + "background-color: #ffffff;"
				        + "padding: 50px 40px;"
				        + "border-radius: 14px;"
				        + "box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);"
				        + "max-width: 450px;"
				        + "text-align: center;"
				        + "}");
				out.println(".signup-card h1 {"
				        + "color: #2e7d32;"
				        + "margin-bottom: 20px;"
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
				        + "transition: background-color 0.3s ease, transform 0.2s ease;"
				        + "}");
				out.println(".btn:hover {"
				        + "background-color: #388e3c;"
				        + "transform: scale(1.02);"
				        + "}");
				out.println("</style>");
				out.println("</head>");
				out.println("<body>");

				out.println("<div class='signup-card'>");
				out.println("<h1>Signup Successful</h1>");
				out.println("<p>Your account has been created successfully.</p>");
				out.println("<br>");
				out.println("<a class='btn' href='login.html'>Click to Login</a>");
				out.println("</div>");

				out.println("</body>");
				out.println("</html>");

			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

}
