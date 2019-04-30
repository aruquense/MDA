package command;

import modelo.Producto;
import java.util.ArrayList;
import modelo.Usuario;

public class SearchCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<Producto> searchList = handler.searchProduct(request.getParameter("busqueda"));           
        request.setAttribute("searchList", searchList);
        ArrayList<Usuario> userList = handler.searchUser(request.getParameter("busqueda"));
        request.setAttribute("userList", userList);
        forward("/busqueda.jsp");  
    }
    
}
