package command;

import java.util.ArrayList;
import modelo.Pedido;

public class GetOrderCommand extends FrontCommand {    

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<Pedido> orders = handler.obtenerPedidos(Integer.valueOf(request.getParameter("idUser")));        
        System.out.println("Tamaño: "+ orders.size());
        for (Pedido order : orders) {
            System.out.println("Order:" + order.toString());
        }
        //forward("/index.jsp");
    }
    
}
