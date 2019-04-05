package command;

import java.sql.Array;
import modelo.Producto;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Pedido;

public class HandlerBDD {
    private Connection conn = null;
    public HandlerBDD(){        
    }
    public Connection conectarBD(){
        try{     
            Class.forName("org.postgresql.Driver");      
            System.out.println("Tratando de conectar");
            this.conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres","postgres","1234");
            System.out.println("HEMOS CONECTADO");
        }catch(ClassNotFoundException |SQLException e){
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }
    public void cerrarBD(Connection conn){
        try{
            conn.close();
        }catch(SQLException e){
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public int encontrarNúmeroProductos(){
        try {
            conectarBD();
            String sql ="SELECT COUNT(*) AS total FROM \"public\".\"Producto\"";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()){            
                int total = rs.getInt("total");
                cerrarBD(conn); 
                return total;
            }
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    public void añadirProducto(int idvendedor, String nombre, double precio, String descripcion, String imagen){
        conectarBD();        
        
        String sql = "INSERT INTO \"public\".\"Producto\"(idvendedor,nombre,precio,descripcion,imagen) values("+idvendedor+",\'"+nombre+"\',"+precio+",\'"+descripcion+"\',\'"+imagen+"\')";        
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }

    void deleteProductoABD(int idProducto) {conectarBD();        
        
        String sql = "DELETE FROM \"public\".\"Producto\"WHERE id="+idProducto+"";
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }

    void actualizarProducto(int idProducto, String nombre, double precio, String descripcion, String imagen) throws SQLException {
        conectarBD();        
        
        String sql = "UPDATE \"public\".\"Producto\" SET nombre = ? ,precio = ? ,descripcion = ?, imagen = ? WHERE id="+idProducto+"";
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.setString(1, nombre);
            enrollItmt.setDouble(2, precio);
            enrollItmt.setString(3, descripcion);
            enrollItmt.setString(4, imagen);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
        
    }
        String leerProducto(int idProducto) throws SQLException {
        conectarBD();        
        
        String sql = "SELECT * FROM \"public\".\"Producto\" WHERE id="+idProducto+"";        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while (rs.next()) {
            String nombre = rs.getString("nombre");
            System.out.println("El nombre del producto es " + nombre + "\n");
            return nombre;
        }
        cerrarBD(conn);
        return "";
    }

    public ArrayList<Producto> searchProduct(String parameter) {
        conectarBD();
        ArrayList<Producto> searchList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Producto\" WHERE LOWER(nombre) LIKE LOWER('%"+parameter+"%')";        
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong("id");
                Long idvendedor = rs.getLong("idvendedor");
                Double precio = rs.getDouble("precio");
                String descripcion = rs.getString("descripcion");
                String img = rs.getString("imagen");
                String nombre = rs.getString("nombre");            
                Producto producto = new Producto(id,nombre,idvendedor,precio,descripcion,img);
                searchList.add(producto);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }        
        cerrarBD(conn);
        return searchList;
    }
    public ArrayList<Pedido> obtenerPedidos(int idUsuario){
        conectarBD();
        ArrayList<Pedido> orderList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Pedido\" WHERE idcomprador="+idUsuario;        
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Long id = rs.getLong("id");
                Long idcomprador = rs.getLong("idcomprador");
                Long idvendedor = rs.getLong("idvendedor");                
                String estado = rs.getString("estado");                                       
                Array productos = rs.getArray("idproductos");            
                Integer[] idProductos = (Integer[])productos.getArray();
                Pedido pedido = new Pedido(id, idcomprador, idvendedor, estado, idProductos);
                orderList.add(pedido);                
            }
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }        
        cerrarBD(conn);
        return orderList;
    }    
}
