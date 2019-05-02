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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Pedido;
import modelo.Usuario;

public class HandlerBDD {
    private Connection conn = null;
    public HandlerBDD(){        
    }
    public Connection conectarBD(){
        try{     
            Class.forName("org.postgresql.Driver");      
            System.out.println("Tratando de conectar");
            this.conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/mda2","postgres","1234");
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
    
    public int encontrarNumeroUsuarios(){
        try {
            conectarBD();
            String sql ="SELECT COUNT(*) AS total FROM \"public\".\"Usuario\"";
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
        long idProducto = encontrarNúmeroProductos()+1;
        conectarBD();        
        String sql = "INSERT INTO \"public\".\"Producto\"(id,idvendedor,nombre,precio,descripcion,imagen,vendido) values("+idProducto+","+idvendedor+",\'"+nombre+"\',"+precio+",\'"+descripcion+"\',\'"+imagen+"\',\'"+0+"\')";        
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
        public Producto leerProducto(int idProducto) throws SQLException {
        conectarBD();        
        
        String sql = "SELECT * FROM \"public\".\"Producto\" WHERE id="+idProducto+"";        
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        Producto producto = null;
        while (rs.next()) {
                Long id = rs.getLong("id");
                Long idvendedor = rs.getLong("idvendedor");
                Double precio = rs.getDouble("precio");
                String descripcion = rs.getString("descripcion");
                String img = rs.getString("imagen");
                String nombre = rs.getString("nombre");            
                producto = new Producto(id,nombre,idvendedor,precio,descripcion,img);
        }
        cerrarBD(conn);
        return producto;
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
        public ArrayList<Producto> searchAdvancedProduct(String parameter, int precioMin, int precioMax) {
        conectarBD();
        ArrayList<Producto> searchList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Producto\" WHERE LOWER(nombre) LIKE LOWER('%"+parameter+"%') AND precio >"+precioMin+"AND precio <"+precioMax;        
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

    

    void registrarUsuario(String idnombre, String idcorreo, String idcontrasena, String idlocalizacion) {            
        int id = encontrarNumeroUsuarios();        
        if(!userExists(idnombre)){                    
            conectarBD();
            String sql = "INSERT INTO \"public\".\"Usuario\"(id,nombre,espremium,correo,contrasena,localizacion,valoracion,nventas,nvisitas) VALUES ("+id+",'"+idnombre+"',0, '"+idcorreo+"','"+idcontrasena+"', '"+idlocalizacion+"',0,0,0);";        
            PreparedStatement enrollItmt;
            try {
                enrollItmt = this.conn.prepareStatement(sql);
                enrollItmt.execute();
            } catch (SQLException ex) {
                Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
            }
            cerrarBD(conn);
        }else{
            System.out.println("Este usuario ya existe");
        }
    }
    public boolean userExists(String nameUser){
        conectarBD();        
        String sql = "SELECT COUNT(*) AS total FROM \"public\".\"Usuario\" WHERE nombre='"+nameUser+"'";        
        Statement stmt;        
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int total = rs.getInt("total");                
                if(total >0)return true;

            }
        }catch(SQLException e){}
        return false;       
    }


    void puntuarUsuario(int idUsuario, int puntuacion) {
        conectarBD();
        String sql = "SELECT * FROM \"public\".\"Usuario\" WHERE id="+idUsuario;        
        Statement stmt;        
        conectarBD();
        Integer nvaloraciones;
                
        Integer valoracion;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                nvaloraciones = rs.getInt("nvaloraciones");
                valoracion = rs.getInt("valoracion");
                nvaloraciones++;
                valoracion+=puntuacion; 
        puntuarUsuarioUpdate(idUsuario,valoracion,nvaloraciones);
                 }
                
                
            
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }        
        cerrarBD(conn);
    }

    private void puntuarUsuarioUpdate(int idUsuario, Integer valoracion, Integer nvaloraciones) {
        conectarBD();        
        
        String sql ="UPDATE public.\"Usuario\" SET valoracion=?, nvaloraciones=? WHERE ID="+idUsuario+"";
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.setInt(1, valoracion);
            enrollItmt.setInt(2, nvaloraciones);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }
    public Usuario getUsuarioByID(long idUser){
        conectarBD();
        Usuario user = null;
        String sql = "SELECT * FROM \"public\".\"Usuario\" WHERE id="+idUser;        
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                int esPremium = rs.getInt("espremium");
                String correo = rs.getString("correo");
                String contrasena = rs.getString("contrasena");
                String localizacion = rs.getString("localizacion");
                Array productos = rs.getArray("idpedidos");            
                Integer[] idpedidos = new Integer[]{};
                if(productos != null)
                    idpedidos = (Integer[])productos.getArray();                
                double valoracion= Double.valueOf(rs.getInt("valoracion"));
                int nventas = Math.toIntExact(rs.getLong("nventas"));
                int nvisitas = Math.toIntExact(rs.getLong("nvisitas"));
                int nvaloraciones=rs.getInt("nvaloraciones");
                long id = rs.getLong("id");
                user = new Usuario(id, nventas, nvisitas,localizacion, nombre, correo, contrasena, valoracion, idpedidos,esPremium,nvaloraciones);

            }
        }catch(SQLException e){
        }
        return user;
        
        
        
    }

    void updateNVisitas(int idUser, int nvisitas) { String sql ="UPDATE public.\"Usuario\" SET nvisitas=? WHERE ID="+idUser;
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.setInt(1, nvisitas);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);

    }
    
        Usuario login(String name, String passwd){
        conectarBD();
        Usuario user =null;
        String sql = "SELECT * FROM public.\"Usuario\" WHERE nombre=" + "'"+name+ "'"+ " AND contrasena=" + "'"+passwd+"'"; 
         Statement stmt;
         /*
         (Long id, int nVentas, int nVisitas,String localizacion, 
         String nombre, String correo, String contrasena, 
         Double valoracion, Integer[] idpedidos, int espremium, int nValoraciones)
         */
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()){
                String nombre = rs.getString("nombre");
                int esPremium = rs.getInt("espremium");
                String correo = rs.getString("correo");
                String contrasena = rs.getString("contrasena");
                String localizacion = rs.getString("localizacion");
                Array productos = rs.getArray("idpedidos");            
                Integer[] idpedidos = new Integer[]{};
                if(productos != null)
                    idpedidos = (Integer[])productos.getArray();                
                Double valoracion = rs.getDouble("valoracion");
                int nventas = Math.toIntExact(rs.getLong("nventas"));
                int nvisitas = Math.toIntExact(rs.getLong("nvisitas"));
                long id = rs.getLong("id");
                int nvaloraciones=rs.getInt("nvaloraciones");
                user = new Usuario(id, nventas, nvisitas,localizacion, nombre, correo, contrasena, valoracion, idpedidos,esPremium,nvaloraciones);
                System.out.println("SE HA CREADO EL USUARIO");
            }
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return user; 
    }           
    public ArrayList<Pedido> obtenerVentas(int idUsuario){
        conectarBD();
        ArrayList<Pedido> orderList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Pedido\" WHERE idvendedor="+idUsuario;        
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

void actualizarUsuario(int idUser, String nombre, String correo, String contrasena, String contrasena2, 
            String localizacion) {
        conectarBD();
        

        String sql ="UPDATE public.\"Usuario\" SET nombre=?, correo=?, contrasena=?, localizacion=? WHERE ID="+idUser+"";
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.setString(1, nombre);
            enrollItmt.setString(2, correo);
            if (contrasena.equals(contrasena2)){
                enrollItmt.setString(3, contrasena);
            }else{
                throw new NullPointerException("WrongPassword");
            }
            
            enrollItmt.setString(4, localizacion);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }


    void markProductSoldFromADB(Long id) throws SQLException {conectarBD();        
        
        String sql = "UPDATE \"public\".\"Producto\" SET vendido = ?  WHERE id="+id+"";
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            int vendido =1;
            enrollItmt.setInt(1, vendido);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }



    void addOrderToBDD(int idcomprador, int idvendedor, List<Producto> order) {
        
            conectarBD();
        List<Integer> arrayIdProducts = new ArrayList<>();
        order.forEach((producto) -> {
            arrayIdProducts.add(Math.toIntExact(producto.getId()));
        });
        String sql = "INSERT INTO public.\"Pedido\"(\n" +
"	idcomprador, idvendedor, estado, idproductos)\n" +
"	VALUES ("+idcomprador+", "+idvendedor+", 'en curso', ARRAY "+arrayIdProducts+");";
        PreparedStatement enrollItmt;
       
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }

    void puntuarUsuario(String nombre, int puntuacion) {
conectarBD();
String sql = "SELECT * FROM \"public\".\"Usuario\" WHERE nombre='"+nombre+"'";        
        
        String sql2 = "SELECT * FROM \"public\".\"Usuario\" WHERE nombre="+nombre;        
        Statement stmt;        
        conectarBD();
        Integer nvaloraciones;
                
        Integer valoracion;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int idUsuario= rs.getInt("id");
                nvaloraciones = rs.getInt("nvaloraciones");
                valoracion = rs.getInt("valoracion");
                nvaloraciones++;
                valoracion+=puntuacion; 
        puntuarUsuarioUpdate(idUsuario,valoracion,nvaloraciones);
                 }
                
                
            
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }        
        cerrarBD(conn);
    }
    ArrayList<Usuario> searchUser(String parameter) {
        conectarBD();
        ArrayList<Usuario> searchList = new ArrayList<>();
        String sql = "SELECT * FROM \"public\".\"Usuario\" WHERE LOWER(nombre) LIKE LOWER('%"+parameter+"%')";        
        Statement stmt;
        try {
            stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                String nombre = rs.getString("nombre");
                int esPremium = rs.getInt("espremium");
                String correo = rs.getString("correo");
                String contrasena = rs.getString("contrasena");
                String localizacion = rs.getString("localizacion");
                Array productos = rs.getArray("idpedidos");            
                Integer[] idpedidos = new Integer[]{};
                if(productos != null)
                    idpedidos = (Integer[])productos.getArray();                
                double valoracion= Double.valueOf(rs.getInt("valoracion"));
                int nventas = Math.toIntExact(rs.getLong("nventas"));
                int nvisitas = Math.toIntExact(rs.getLong("nvisitas"));
                int nvaloraciones=rs.getInt("nvaloraciones");
                long id = rs.getLong("id");
                searchList.add(new Usuario(id, nventas, nvisitas,localizacion, nombre, correo, contrasena, valoracion, idpedidos,esPremium,nvaloraciones));
            }  
        }catch(SQLException e){
            
        }
        return searchList;
    }
}

