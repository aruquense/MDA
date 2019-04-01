package command;

public class AddProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        int idVendedor = Integer.parseInt(request.getParameter("idvendedor"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        handler.añadirProductoABD(idVendedor, nombre, precio, descripcion, imagen);
        forward("/index.jsp");
    }
    
}
