package paymentProject;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderHistoryDao {
    private Connection con;

    public OrderHistoryDao(Connection con) {
        this.con = con;
    }

    // Fetch all orders for a specific customer
    public List<Order> getOrdersByCustomerId(int customerId) {
        List<Order> orders = new ArrayList<>();
        String query = "SELECT r.ReceiptID, o.OrderID, r.ReceiptDate, p.ProdName, op.ProdQuantity, p.ProdPrice " +
                       "FROM product p " +
                       "JOIN order_product op ON p.ProdID = op.ProdID " +
                       "JOIN orders o ON op.OrderID = o.OrderID " +
                       "JOIN receipt r ON o.OrderID = r.OrderID " +
                       "JOIN customer c ON o.CustID = c.CustID " +
                       "WHERE c.CustID = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, customerId);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setReceiptId(rs.getInt("ReceiptID"));
                    order.setOrderId(rs.getInt("OrderID"));
                    order.setReceiptDate(rs.getString("ReceiptDate"));
                    order.setProductName(rs.getString("ProdName"));
                    order.setQuantity(rs.getInt("ProdQuantity"));
                    order.setPrice(rs.getDouble("ProdPrice"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }


    // Fetch specific order details by orderId
    public Order getOrderById(int orderId) {
        Order order = null;
        String query = "SELECT * FROM orders WHERE OrderID = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, orderId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    order = new Order();
                    order.setOrderId(rs.getInt("OrderID"));
                    order.setCustId(rs.getInt("CustID"));
                    order.setOrderDate(rs.getString("OrderDate"));
                    order.setProductName(rs.getString("ProductName"));
                    order.setQuantity(rs.getInt("Quantity"));
                    order.setPrice(rs.getDouble("Price"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }

    // Fetch receipt details by orderId
    public Receipt getReceiptByOrderId(int orderId) {
        Receipt receipt = null;
        String query = "SELECT * FROM receipt WHERE OrderID = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, orderId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    receipt = new Receipt();
                    receipt.setOrderID(rs.getInt("OrderID"));
                    receipt.setReceiptDate(rs.getString("ReceiptDate"));
                    receipt.setReceiptTime(rs.getString("ReceiptTime"));
                    receipt.setPaymentMethod(rs.getString("PaymentMethod"));
                    receipt.setDeliveryType(rs.getString("DeliveryType"));
                    receipt.setTotalPayment(rs.getDouble("TotalPayment"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receipt;
    }

    // Fetch all receipts for a specific customer, if needed
    public List<Receipt> getReceiptsByCustomerId(int customerId) {
        List<Receipt> receipts = new ArrayList<>();
        String query = "SELECT * FROM receipt WHERE CustID = ?";

        try (PreparedStatement pst = con.prepareStatement(query)) {
            pst.setInt(1, customerId);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    Receipt receipt = new Receipt();
                    receipt.setOrderID(rs.getInt("OrderID"));
                    receipt.setReceiptDate(rs.getString("ReceiptDate"));
                    receipt.setReceiptTime(rs.getString("ReceiptTime"));
                    receipt.setPaymentMethod(rs.getString("PaymentMethod"));
                    receipt.setDeliveryType(rs.getString("DeliveryType"));
                    receipt.setTotalPayment(rs.getDouble("TotalPayment"));
                    receipts.add(receipt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receipts;
    }
}