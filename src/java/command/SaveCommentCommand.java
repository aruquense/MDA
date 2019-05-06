/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

/**
 *
 * @author orlan
 */
public class SaveCommentCommand extends FrontCommand {

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        handler.writeComment(request.getParameter("idAuthor"), request.getParameter("idProduct"), request.getParameter("comment"));
        forward("/index.jsp");
    }
    
}
