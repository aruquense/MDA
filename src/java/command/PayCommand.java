package command;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modelo.Producto;


public class PayCommand extends FrontCommand {    

    @Override
    public void process() {
        try {
            MarkProductsAsSold();
            AddProductsToNewOrder();
            
        } catch (SQLException ex) {
            Logger.getLogger(PayCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void AddProductsToNewOrder() {
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }
        
        ArrayList<Producto> productosDelCarrito = (ArrayList<Producto>) carrito.getContents();
        int idcomprador = Integer.parseInt(request.getParameter("idcomprador"));
        while(!productosDelCarrito.isEmpty()){
            List<Producto> productosDelVendedorX = carrito.getContentsSeller(Math.toIntExact(productosDelCarrito.get(productosDelCarrito.size()).getIdvendedor()));
            HandlerBDD handler = new HandlerBDD();
            int idvendedor = Math.toIntExact(productosDelCarrito.get(productosDelCarrito.size()).getIdvendedor());
            handler.addOrderToBDD(idcomprador, idvendedor, (ArrayList<Producto>) productosDelVendedorX);
            BorrarProductosDelCarrito(productosDelVendedorX);
            
        }
        
    }


    private void MarkProductsAsSold() throws SQLException {
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }
        List<Producto> items = carrito.getContents();
        HandlerBDD handler = new HandlerBDD();
        for(Producto item : items){
            handler.markProductSoldFromADB(item.getId());
            
        }
    }


    private void BorrarProductosDelCarrito(List<Producto> contents2) {         
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }       
        for(Producto item : contents2){
            carrito.deleteProduct(item.getNombre());
            
        }
    }
    
}
