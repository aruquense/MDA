/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import javax.servlet.http.HttpSession;
import modelo.Carrito;

/**
 *
 * @author sergio
 */
public class RemoveFromShoppingCartCommand extends FrontCommand{

    @Override
    public void process() {
        HttpSession sesion = request.getSession(true);
        Carrito carrito =(Carrito) sesion.getAttribute("carrito");
        if(carrito == null){
            carrito = new Carrito();
            carrito.initialize();
            sesion.setAttribute("carrito",carrito);
        }
        carrito.deleteProduct(request.getParameter("idproducto"));
        forward("/index.jsp");
    }
    
}
