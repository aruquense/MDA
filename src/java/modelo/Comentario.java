/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author orlan
 */
public class Comentario {

    private long id, idAuthor, idproducto;
    private String comentario; 
    
    public Comentario(long id, long idAuthor, String comentario, long idproducto) {
        this.id = id;
        this.idAuthor = idAuthor; 
        this.idproducto = idproducto; 
        this.comentario = comentario; 
    }

    public long getId() {
        return id;
    }

    public long getIdAuthor() {
        return idAuthor;
    }

    public long getIdproducto() {
        return idproducto;
    }

    public String getComentario() {
        return comentario;
    }

    @Override
    public String toString() {
        return "Comentario{" + "id=" + id + ", idAuthor=" + idAuthor + ", idproducto=" + idproducto + ", comentario=" + comentario + '}';
    }
    
    
    
}
