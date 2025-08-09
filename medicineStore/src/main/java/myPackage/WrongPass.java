package myPackage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WrongPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str=(String) request.getAttribute("uname");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		out.println("<!DOCTYPE html>");
		out.println("<html lang='en'>");
		out.println("<head>");
		out.println("<meta charset='UTF-8'>");
		out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
		out.println("<title>Login Failed</title>");
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
		        + "}");
		out.println("h2 {"
		        + "color: #d32f2f;"
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

		out.println("<div class='error-card'>");
		out.println("<h2>Hello " + str + ",<br> You have entered a wrong password.</h2>");
		out.println("<a class='btn' href='login.html'>Click to Login</a>");
		out.println("</div>");

		out.println("</body>");
		out.println("</html>");


	}

}
