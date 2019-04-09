/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

/**
 *
 * @author Gustavo
 */
public class UnloginCommand extends FrontCommand{

    @Override
    public void process() {
        session.invalidate();
        forward("/index2.jsp");
    }
    
}
