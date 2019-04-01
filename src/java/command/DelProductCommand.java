package command;

public class DelProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        handler.deleteProductoABD(idProducto);
        forward("/index.jsp");
    }
    
}
