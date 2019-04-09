/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author sergio
 */
public class Carrito {
    List<Producto> productList;
    public void initialize(){
        productList = new ArrayList<>();
    }
    
    public void addProduct(Producto producto){
        try{
            if(productList.isEmpty()){
                productList.add(producto);
            }else{
                boolean alreadyExists = false;
                for(Producto p : productList){
                    if( p.getId() == producto.getId()){
                        alreadyExists = true;
                        break;
                    }
                }
                if(!alreadyExists){
                    productList.add(producto);
                }
            }
        }catch(Exception e){}
    }
    public void deleteProduct(String idProducto){
        try{
            if(productList.size() == 0){
                return;
            }else{
                for(Producto p : productList){
                    if(p.getId() == Integer.parseInt(idProducto)){
                        productList.remove(p);
                    }
                }
            }
        }catch(Exception e){}
    }
    public List getContents(){
        return productList;
    }

    public void clear() {
        productList.clear();
    }
        
}
