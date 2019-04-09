/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import javax.servlet.http.HttpSession;
import modelo.Usuario;

/**
 *
 * @author OrlandoPadrón
 */
public class LoginCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD bdd = new HandlerBDD();
        HttpSession sesion = request.getSession(true);
        String nombre = request.getParameter("userName");
        String passwd = request.getParameter("password");
        Usuario user = bdd.login(nombre, passwd); 
        if (user != null){
            request.setAttribute("usuario", user);
        }
        forward("/inicioSesionBasic.jsp?nombre="+user.getNombre());
    }
    
}
