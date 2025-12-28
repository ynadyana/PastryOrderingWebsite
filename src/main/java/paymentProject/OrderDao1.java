package paymentProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import paymentProject.*;

public class OrderDao1 {

    private Connection con;

    private String query;
    private PreparedStatement pst;
    private ResultSet rs;

    public OrderDao1(Connection con) {
        this.con = con;
    }

        public boolean insertOrder(Order model) {
            boolean result = false;
            try {
                query = "INSERT INTO orders(TotalPrice,CustID) VALUES(?, ?)";
                pst = this.con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                pst.setDouble(1, model.getPrice());
                pst.setInt(2, model.getCustId());
                
                pst.executeUpdate();
                result = true;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return result;
        }

        public int getLastOrderId() throws SQLException {
            query = "SELECT LAST_INSERT_ID() AS last_id";
            pst = this.con.prepareStatement(query);
            rs = pst.executeQuery();
            if (rs.next()) {
                return rs.getInt("last_id"); // Get the value from the first column
            }
            return -1; // Or throw an exception if preferred
        }

        public boolean insertOrderDetails(OrderDetails model) {
            boolean result = false;
            try {
                query = "INSERT INTO order_product(ProdID, OrderID, ProdQuantity) VALUES(?, ?, ?)";
                pst = this.con.prepareStatement(query);
                pst.setInt(1, model.getProduct_id());
                pst.setInt(2, model.getOrder_id());
                pst.setInt(3, model.getQuantity());
                
                pst.executeUpdate();
                result = true;
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
            return result;
        }

    public List<Order> userOrders(int id) {
        List<Order> list = new ArrayList<>();
        try {
            query = "SELECT * FROM orders WHERE CustID=? ORDER BY OrderID DESC";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(this.con);
                int orderId = rs.getInt("order_id");
                order.setOrderId(orderId);
                order.setCustId(rs.getInt("cust_id"));

                // Fetch order details
                query = "SELECT * FROM order_product WHERE OrderID=?";
                PreparedStatement detailStmt = this.con.prepareStatement(query);
                detailStmt.setInt(1, orderId);
                ResultSet detailRs = detailStmt.executeQuery();

                double totalPrice = 0.0;
                while (detailRs.next()) {
                    Product product = productDao.getSingleProduct(detailRs.getInt("product_id"));
                    double itemPrice = detailRs.getDouble("TotalAmount");
                    int quantity = detailRs.getInt("ProdQuantity");
                    totalPrice += itemPrice * quantity;
                }

                
                //order.setTotalPrice(totalPrice); // Assuming quantity is total number of items
                
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void cancelOrder(int id) {
        try {
            con.setAutoCommit(false); // Start transaction

            // Delete from order_details table
            query = "DELETE FROM order_product WHERE OrderID=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();

            // Delete from orders table
            query = "DELETE FROM orders WHERE OrderID=?";
            pst = this.con.prepareStatement(query);
            pst.setInt(1, id);
            pst.executeUpdate();

            con.commit(); // Commit transaction
        } catch (SQLException e) {
            if (con != null) {
                try {
                    con.rollback(); // Rollback transaction in case of error
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
        } finally {
            try {
                if (pst != null) pst.close();
                con.setAutoCommit(true); // Restore auto-commit mode
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    

}
