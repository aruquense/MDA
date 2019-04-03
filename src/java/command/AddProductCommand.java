package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;



public class AddProductCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            
            int idVendedor = Integer.parseInt(request.getParameter("idvendedor"));
            String nombre = request.getParameter("nombre");
            double precio = Double.parseDouble(request.getParameter("precio"));
            String descripcion = request.getParameter("descripcion");
            String path = uploadFile();
            handler.añadirProducto(idVendedor, nombre, precio, descripcion, path);
            forward("/index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(AddProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }        
    public String uploadFile() throws IOException, ServletException {        
        Part part = (Part) (Part) request.getPart("file");         
                        //new File("Ruta de la carpeta de cada miembro imgs en Netbeans")
        File uploads = new File("J:\\Users\\Default\\Documents\\NetBeansProjects\\MDA\\web\\imgs");
        int tam = handler.encontrarNúmeroProductos()+1;
        File file = new File(uploads, "img"+tam+".jpg");
        try (InputStream input = part.getInputStream()) {
            Files.copy(input, file.toPath());
        }
        return "./imgs/img"+tam+".jpg";
    }

}
