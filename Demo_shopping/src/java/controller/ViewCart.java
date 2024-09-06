/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.DAO;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.HttpCookie;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author 84868
 */
@WebServlet(name = "ViewCart", urlPatterns = {"/ViewCart"})
public class ViewCart extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        List<Product> list = new ArrayList<>();
        DAO dao = new DAO();

        // Kiểm tra giỏ hàng từ session
        String txt = (String) session.getAttribute("id");
        System.out.println("Cart in session: " + txt);

        // Lấy sản phẩm từ danh sách ID trong session
        if (txt != null) {
            String[] ids = txt.split(",");
            for (String id : ids) {
                list.add(dao.getProductByID(id));
            }
        }

        // Kiểm tra danh sách sản phẩm
        System.out.println("List of products in cart:");
        for (Product product : list) {
            System.out.println(product);
        }

        // Đếm số lượng sản phẩm
        for (int i = 0; i < list.size(); i++) {
            Product product = list.get(i);
            if (product != null) {
                int count = 1;
                for (int j = i + 1; j < list.size(); j++) {
                    Product otherProduct = list.get(j);
                    if (otherProduct != null && product.getId() == otherProduct.getId()) {
                        count++;
                        list.set(j, null);
                    }
                }
                product.setQuantity(count);
            }
        }

        // Xóa các sản phẩm null khỏi danh sách
        list.removeIf(product -> product == null);

        // Tính tổng giá trị của giỏ hàng
        double total = 0;
        for (Product o : list) {
            total += o.getQuantity() * o.getPrice();
        }

        // Pass cart items to the JSP for rendering
        request.setAttribute("list", list);
        request.setAttribute("total", total);
        request.setAttribute("vat", 0.1 * total);
        request.setAttribute("sum", 1.1 * total);

        request.getRequestDispatcher("Cart.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpCookie Cookies = request.getCookies();
        String productId = request.getParameter("productId");

        // Kiểm tra sản phẩm ID được chọn để xóa
        System.out.println("Product to remove: " + productId);

        if (productId != null) {
            String cartSession = (String) session.getAttribute("id");
            if (cartSession != null) {
                // Xóa productId khỏi giỏ hàng
                String[] ids = cartSession.split(",");
                String updatedCart = "";
                for (String id : ids) {
                    if (!id.equals(productId)) {
                        if (!updatedCart.isEmpty()) {
                            updatedCart += ",";
                        }
                        updatedCart += id;
                    }
                }
                session.setAttribute("id", updatedCart);
            }
        }

        // Chuyển hướng trở lại trang giỏ hàng
        response.sendRedirect(request.getContextPath() + "/ViewCart");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
