/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import modelo.Carrito;
import modelo.Producto;

/**
 *
 * @author sergio
 */
public class AddToShoppingCartCommand extends FrontCommand {

    @Override
    public void process() {
        HttpSession sesion = request.getSession(true);
        HandlerBDD handler = new HandlerBDD();
        Producto product = null;
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        try {
            product = handler.leerProducto(idProducto);            
        } catch (SQLException ex) {
            Logger.getLogger(ReadProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }
        carrito.addProduct(product,request.getParameter("cantidad"));
        forward("/index.jsp");
    }
}
