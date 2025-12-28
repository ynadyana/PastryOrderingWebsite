package paymentProject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import RegisterModel.*;

@WebServlet(name= "CheckOutServlet1", urlPatterns = "/cart-check-out1")
public class CheckOutServlet1 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try(PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
            UserBean auth = (UserBean) session.getAttribute("auth");

            if(cart_list != null && auth != null) {
                ProductDao pDao = new ProductDao(DbCon.getConnection());
                List<Cart> cartProduct = pDao.getCartProducts(cart_list);
                double total = pDao.getTotalCartPrice(cart_list);
                
                // Create an Order object and set the cart list
                Order order = new Order();
                order.setCartList(cartProduct);
                order.setCustId(auth.getCustID());
                order.setPrice(total);

                
                // Insert the order into the database
                OrderDao1 orderDao = new OrderDao1(DbCon.getConnection());
                boolean orderInserted = orderDao.insertOrder(order);
                
                
                if(orderInserted) {
                    // Retrieve the generated order ID
                    int orderId = orderDao.getLastOrderId();
                    
                    session.setAttribute("orderId", orderId);

                    // Insert each cart item into the order_product table
                    for(Cart c : cart_list) {
                        OrderDetails orderDetails = new OrderDetails();
                        orderDetails.setOrder_id(orderId);
                        orderDetails.setProduct_id(c.getId());
                        orderDetails.setQuantity(c.getQuantity());

                        orderDao.insertOrderDetails(orderDetails);
                    }
                 
                    session.setAttribute("cart-list", cart_list);
                     response.sendRedirect("paymentForm.jsp");
                    
                } else {
                    response.sendRedirect("orderFailure.jsp");
                }
                
               
            } else {
                if(auth == null) {
                    response.sendRedirect("signin.jsp");
                } else {
                    response.sendRedirect("cart.jsp");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
