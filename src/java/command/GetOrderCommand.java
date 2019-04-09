package command;

import java.util.ArrayList;
import modelo.Pedido;

public class GetOrderCommand extends FrontCommand {    

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<Pedido> orders = handler.obtenerPedidos(Integer.valueOf(request.getParameter("idUser")));                
        request.setAttribute("orderList", orders);
        ArrayList<Pedido> ordersSell = handler.obtenerVentas(Integer.valueOf(request.getParameter("idUser")));
        request.setAttribute("orderSell", ordersSell);
        forward("/pedidos.jsp");
    }
    
}
