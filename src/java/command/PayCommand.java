package command;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modelo.Pedido;
import modelo.Producto;


public class PayCommand extends FrontCommand {    

    @Override
    public void process() {
        try {
            AddProductsToNewOrder();
            ClearProductsFromCustomer();
            ClearShoppingCart();
        } catch (SQLException ex) {
            Logger.getLogger(PayCommand.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    private void AddProductsToNewOrder() {
        //Bosquejo de estructura
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }
        List<Producto> contents = carrito.getContents();
        for(Producto producto : contents){
            producto.getId();
	}
        Integer[] idproductos=null;
        Long id=null;
        Long idcomprador=null;
        Long idvendedor=null;
        String estado="En curso";
        Pedido order= new Pedido( id, idcomprador, idvendedor, estado, idproductos);
    }

    private void ClearShoppingCart() {
        //Pendiente de comprobar
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }    
        carrito.clear();
    }

    private void ClearProductsFromCustomer() throws SQLException {
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
        //Pendiente de hacer
            handler.deleteProductFromCustomer(item.getId(),item.getIdvendedor());
            
        //Comprobado
            handler.markProductSoldFromADB(item.getId());
            
        }
    }
    
}
