package command;

import static java.sql.DriverManager.println;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modelo.Producto;
import modelo.Usuario;


public class PayCommand extends FrontCommand {    

    @Override
    public void process() {
        try {
            MarkProductsAsSold();
            AddProductsToNewOrder();
            forward("/contrarrembolso.jsp");
            
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
        Usuario user =(Usuario) sesion.getAttribute("user");
        if(user == null){
            user = new Usuario();
            sesion.setAttribute("user",user);
        }
           
        
        
        //NO SE PILLAR EL COMPRADOR
        int idcomprador;
        idcomprador = Math.toIntExact(1);
       //NO SE PILLAR EL COMPRADOR
        
       List<Long> vendedores= carrito.VendedoresDiferentes();
        Iterator<Long> iterator = vendedores.iterator();
        while (iterator.hasNext()) {
            int idvendedor = Math.toIntExact(iterator.next());
            List<Producto> productosDelVendedorX = carrito.getProductsSameSeller(idvendedor);
            HandlerBDD handler = new HandlerBDD();
            handler.addOrderToBDD(idcomprador, idvendedor, productosDelVendedorX);
	}
        carrito.clear();
        
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

    
}
