/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author sergio
 */
public class Carrito {
    Map<Producto,Integer> productList;
    public void initialize(){
        productList = new HashMap<Producto,Integer>();
    }
    
    public void addProduct(Producto producto,String cantidad){
        try{
            int cant = Integer.parseInt(cantidad);
            if(productList.size() == 0){
                productList.put(producto, cant);
            }else{
                boolean added = false;
                for (Map.Entry<Producto, Integer> entry : productList.entrySet()) {
                   if(entry.getKey().getId() == producto.getId()){
                       productList.remove(entry.getKey());
                       productList.put(producto, entry.getValue()+cant);
                       added = true;
                   }
                }
                if(!added){
                    productList.put(producto, cant);
                }
            }
        }catch(Exception e){}
    }
    public void deleteProduct(String idProducto){
        try{
            if(productList.size() == 0){
                return;
            }else{
                for (Map.Entry<Producto, Integer> entry : productList.entrySet()) {
                   if(entry.getKey().getId() == Integer.parseInt(idProducto)){
                       productList.remove(entry.getKey());
                   }
                }
            }
        }catch(Exception e){}
    }
    public Map getContents(){
        return productList;
    }
        
}
