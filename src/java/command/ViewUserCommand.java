package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
import modelo.Usuario;



public class ViewUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {  
		HandlerBDD handler = new HandlerBDD();
        Usuario user = null;
        int idUser = Integer.parseInt(request.getParameter("idUser"));        
        try {
            user = handler.getUsuarioByID(idUser);
            String nombre = user.getNombre();
		String correo = user.getCorreo();
		String localizacion = user.getLocalizacion();
		int nvaloraciones = user.getnValoraciones();
		Double valoracion = user.getValoracion()/(nvaloraciones);
		int nvisitas =user.getnVisitas()+1;
		String img = user.getImagen();
                handler.updateNVisitas(idUser,nvisitas);
                        
		forward("/user.jsp?nombre="+nombre+
                        "&correo="+correo+
                        "&localizacion="+localizacion+
                        "&valoracion="+valoracion+         
                        "&nvaloraciones="+nvaloraciones+
                        "&nvisitas="+nvisitas+
                        "&img="+img+
                        "&valoracion="+valoracion);
			
        } catch (Exception ex) {
            Logger.getLogger(ViewUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
		
    }        
    

}
