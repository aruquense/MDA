/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import modelo.Pedido;

/**
 *
 * @author OrlandoPadrón
 */
public class GetOrderDetailsCommand extends FrontCommand {    

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        Pedido order = handler.getOrderById(Integer.valueOf(request.getParameter("idOrder")));
        request.setAttribute("orderDetails", order);
        forward("/detallesPedidos.jsp");
    }
    
}

