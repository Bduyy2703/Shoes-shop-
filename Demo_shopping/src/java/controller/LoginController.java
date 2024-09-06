package controller;

import dao.DAO;
import entity.Account;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String userID = request.getParameter("userId");
        String password = request.getParameter("password");
        
        try {
            DAO dao = new DAO();
            Account user = dao.login(userID, password);

            if (user == null) {
                request.setAttribute("mess", "Invalid Username or Password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else {
                // Store the logged-in user in a session
                HttpSession session = request.getSession();
                session.setAttribute("acc", user);
                response.sendRedirect("HomeController"); // Redirect to the home page
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions properly in your application
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal Server Error");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Login Controller Servlet";
    }
}
