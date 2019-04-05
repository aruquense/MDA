package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;



public class ScoreUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            int puntuacion = Integer.parseInt(request.getParameter("puntuacion"));
            
            handler.puntuarUsuario(idUsuario, puntuacion);
            forward("/index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(ScoreUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }        
    

}
