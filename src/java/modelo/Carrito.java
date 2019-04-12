/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

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
    
    public List getProductsSameSeller(int id){
        List<Producto> ProductosVendedor= new ArrayList<>();
        try{
            if(productList.size() == 0){
                return ProductosVendedor;
            }else{
                for(Producto p : productList){
                    if(p.getIdvendedor()==id){
                        ProductosVendedor.add(p);
                    }
                }
                
            }
        }catch(Exception e){}
                return ProductosVendedor;
    }

    public void clear() {
        productList.clear();
    }

    public int numeroDeProductos() {
        return this.productList.size();
    }

    public Producto getProduct(int i) {
        return this.productList.get(i);
    }

    public Producto nextProduct() {
        return this.productList.get(0);
        
    }

    public List<Long> VendedoresDiferentes() {
        List<Long> nVendedor= new ArrayList<>();
        Iterator<Producto> iterator = this.productList.iterator();
        while (iterator.hasNext()) {
            nVendedor.add(iterator.next().getIdvendedor());
	}
    List<Long> sinDuplicados;
        sinDuplicados = nVendedor
                .stream()
                .distinct()
                .collect(Collectors.toList());
        return sinDuplicados;
		
        
        
    }

        
}
