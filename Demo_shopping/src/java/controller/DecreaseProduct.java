/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "DecreaseProduct", urlPatterns = {"/DecreaseProduct"})
public class DecreaseProduct extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");

    String id = request.getParameter("id");
    HttpSession session = request.getSession();

    String txt = (String) session.getAttribute("id");

    if (txt != null && !txt.isEmpty()) {
        String[] productIds = txt.split(",");

        // Tìm index của ID sản phẩm cần giảm
        int index = -1;
        for (int i = 0; i < productIds.length; i++) {
            if (productIds[i].equals(id)) {
                index = i;
                break;
            }
        }

        // Nếu tìm thấy ID, giảm số lượng
        if (index != -1) {
            // Lấy số lượng từ session
            String quantityTxt = (String) session.getAttribute("quantity");
            int quantity = Integer.parseInt(quantityTxt);

            // Giảm số lượng
            if (quantity > 0) {
                quantity--;
            }

            // Cập nhật số lượng vào session
            session.setAttribute("quantity", String.valueOf(quantity));

            // Xóa ID sản phẩm nếu số lượng là 0, ngược lại giảm số lượng
            if (index == 0 && productIds.length == 1) {
                txt = "";
            } else {
                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < productIds.length; i++) {
                    if (i != index) {
                        sb.append(productIds[i]);
                        if (i < productIds.length - 1) {
                            sb.append(",");
                        }
                    }
                }
                txt = sb.toString();
            }
        }
    }

    session.setAttribute("id", txt);

    response.sendRedirect("ViewCart");
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
        return "Short description";
    }
}
