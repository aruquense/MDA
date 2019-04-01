/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gustavo
 */
public class HandlerBDD {
    private Connection conn = null;
    public HandlerBDD(){        
    }
    public Connection conectarBD(){
        try{     
            Class.forName("org.postgresql.Driver");      
            System.out.println("Tratando de conectar");
            this.conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mdaBDD3","postgres","1234");
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
    public void añadirProductoABD(int idvendedor, String nombre, double precio, String descripcion, String imagen){
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

    public ArrayList<String> searchProduct(String parameter) {
        conectarBD();
        ArrayList<String> searchList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Producto\" WHERE nombre LIKE '%"+parameter+"%'";        
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String nombre = rs.getString("nombre");            
                searchList.add(nombre);
            }
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }        
        cerrarBD(conn);
        return searchList;
    }
}
