package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;



public class ComentarUsuario extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            
            int idVendedor = Integer.parseInt(request.getParameter("idvendedor"));
            int idUsuario = Integer.parseInt(request.getParameter("idusuariocomentando"));
            String comentario = request.getParameter("comentario");
            handler.comentarUsuario(idVendedor, idUsuario, comentario);
            forward("/index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ComentarUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
    }  
}
